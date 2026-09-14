#!/usr/bin/env python3
"""Validate Interface Graph YAML files against schema/graph.schema.yaml."""

from __future__ import annotations

import argparse
from pathlib import Path
import sys

try:
    import yaml
except ImportError:
    print("ERROR: PyYAML is required (pip install pyyaml)", file=sys.stderr)
    raise SystemExit(2)

ROOT = Path(__file__).resolve().parents[1]
SCHEMA_PATH = ROOT / "schema" / "graph.schema.yaml"


def load(path: Path):
    with path.open(encoding="utf-8") as f:
        return yaml.safe_load(f) or {}


def validate(path: Path, schema: dict) -> list[str]:
    data = load(path)
    errors: list[str] = []

    nodes = data.get("nodes", [])
    edges = data.get("edges", [])
    if not isinstance(nodes, list):
        return [f"{path}: nodes must be a list"]
    if not isinstance(edges, list):
        return [f"{path}: edges must be a list"]

    node_ids: set[str] = set()
    world_count = 0
    allowed_types = schema.get("node_types", {})
    allowed_edges = set(schema.get("edge_types", []))

    for i, node in enumerate(nodes):
        if not isinstance(node, dict):
            errors.append(f"{path}: node[{i}] must be an object")
            continue
        node_id = node.get("id")
        node_type = node.get("type")
        if not node_id or not node_type:
            errors.append(f"{path}: node[{i}] requires id and type")
            continue
        if node_id in node_ids:
            errors.append(f"{path}: duplicate node id: {node_id}")
        node_ids.add(node_id)
        spec = allowed_types.get(node_type)
        if spec is None:
            errors.append(f"{path}: unknown node type: {node_type}")
            continue
        for field in spec.get("required", []):
            if field not in node:
                errors.append(f"{path}: node {node_id} missing required field: {field}")
        if node_type == "world":
            world_count += 1

    if schema.get("rules", {}).get("world_is_singular") and world_count > 1:
        errors.append(f"{path}: World singularity violated ({world_count} world nodes)")

    edge_ids: set[str] = set()
    for i, edge in enumerate(edges):
        if not isinstance(edge, dict):
            errors.append(f"{path}: edge[{i}] must be an object")
            continue
        edge_id = edge.get("id")
        source = edge.get("source")
        target = edge.get("target")
        edge_type = edge.get("type")
        if edge_id:
            if edge_id in edge_ids:
                errors.append(f"{path}: duplicate edge id: {edge_id}")
            edge_ids.add(edge_id)
        if source not in node_ids:
            errors.append(f"{path}: edge {edge_id or i} unknown source: {source}")
        if target not in node_ids:
            errors.append(f"{path}: edge {edge_id or i} unknown target: {target}")
        if edge_type not in allowed_edges:
            errors.append(f"{path}: edge {edge_id or i} unknown type: {edge_type}")

    return errors


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("paths", nargs="*", help="Graph YAML files")
    args = parser.parse_args()
    schema = load(SCHEMA_PATH)
    paths = [Path(p) for p in args.paths] if args.paths else [ROOT / "graph.yaml", *sorted((ROOT / "examples").glob("*.yaml"))]
    all_errors: list[str] = []
    for path in paths:
        errors = validate(path, schema)
        if errors:
            all_errors.extend(errors)
        else:
            print(f"OK {path.relative_to(ROOT)}")
    for error in all_errors:
        print(f"ERROR {error}", file=sys.stderr)
    return 1 if all_errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
