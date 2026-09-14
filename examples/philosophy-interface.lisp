;;; Philosophy → Interface declaration example

(declaration
  (philosopher gibson)
  (concept affordance)
  (claim "An environment offers action possibilities relative to an actor.")
  (relation (agent environment action))
  (interface
    (exposes action-possibilities)
    (constrains action-possibilities))
  (effect (action-available)))

(declaration
  (philosopher barad)
  (concept intra-action)
  (claim "Entities and boundaries emerge through relations.")
  (relation (relation boundary emergence))
  (interface
    (participates-in identity boundary))
  (effect (boundary-generated)))

(mapping
  (from philosophy.lisp)
  (to taxonomy.yaml graph.yaml contract.yaml)
  (mode declarative)
  (operation describe)
  (operation constrain)
  (operation generate))

(cycle
  (declaration)
  (relation)
  (interface)
  (effect)
  (graph-state)))
