;;; philosophy.lisp
;;; Declarative Interface Ontology
;;; Declarations describe relations; they do not execute.

(model declarative)

(rules
  (philosophy-is-not-implementation)
  (concepts-are-declarations)
  (declarations-describe-relations)
  (declarations-may-constrain-interfaces)
  (declarations-do-not-execute)
  (world-is-singular)
  (models-are-multiple))

(declaration
  (philosopher simondon)
  (concept transduction)
  (claim "Relation produces transformation across a boundary.")
  (relation (difference interface transformation))
  (interface (transforms relation))
  (effect (new-relation new-state)))

(declaration
  (philosopher latour)
  (concept mediator)
  (claim "A mediator transforms what passes through a relation.")
  (relation (actor mediator transformation))
  (interface (mediates input output relation))
  (effect (transformed-relation)))

(declaration
  (philosopher deleuze)
  (concept difference-and-becoming)
  (relation (difference encounter event becoming))
  (interface (site-of-becoming))
  (effect (state-change)))

(declaration
  (philosopher nancy)
  (concept being-with)
  (relation (self other between))
  (interface (exists-through-relation))
  (effect (relation-formed)))

(declaration
  (philosopher derrida)
  (concept differance-and-translation)
  (relation (difference trace translation misdelivery))
  (interface (preserves-difference translation reinterpretation misdelivery))
  (effect (changed-meaning)))

(declaration
  (philosopher foucault)
  (concept dispositif)
  (relation (power knowledge action))
  (interface (configures possible-actions))
  (effect (changed-action-space)))

(declaration
  (philosopher luhmann)
  (concept system-boundary)
  (relation (system boundary environment))
  (interface (selects-what-crosses-boundary))
  (effect (selected-information)))

(declaration
  (philosopher mcluhan)
  (concept medium)
  (relation (medium environment interaction))
  (interface (shapes-interaction-conditions))
  (effect (changed-interaction-pattern)))

(declaration
  (philosopher gibson)
  (concept affordance)
  (relation (agent environment action))
  (interface (exposes-constrains action-possibilities))
  (effect (action-available)))

(declaration
  (philosopher bateson)
  (concept difference-that-makes-a-difference)
  (relation (difference observation change))
  (interface (makes-observable relevant-difference))
  (effect (state-update)))

(declaration
  (philosopher barad)
  (concept intra-action)
  (relation (relation boundary emergence))
  (interface (participates-in identity boundary))
  (effect (boundary-generated)))

(declaration
  (philosopher merleau-ponty)
  (concept lived-body)
  (claim "Perception is constituted through the body's engagement with the world.")
  (relation (body perception world))
  (interface (mediates embodied-perception))
  (effect (embodied-understanding)))

(declaration
  (philosopher whitehead)
  (concept actual-occasion)
  (claim "Reality consists of processes of becoming, not static substances.")
  (relation (process event actual-occasion))
  (interface (site-of-actualization))
  (effect (new-actual-occasion)))

(declaration
  (philosopher delanda)
  (concept assemblage)
  (claim "Heterogeneous components produce emergent properties through their relations.")
  (relation (parts relations emergent-properties))
  (interface (assembles heterogeneous-components))
  (effect (emergent-capability)))

(declaration
  (philosopher stiegler)
  (concept epiphylogenesis)
  (claim "Technology serves as externalized memory that constitutes human temporality.")
  (relation (human technology memory))
  (interface (externalizes preserves-memory))
  (effect (expanded-temporal-horizon)))

(declaration
  (philosopher haraway)
  (concept companion-species)
  (claim "Boundaries between species are constituted through mutual co-creation.")
  (relation (human non-human co-constitution))
  (interface (blurs species-boundaries))
  (effect (mutual-co-creation)))

(cycle
  (action subject)
  (interaction interface)
  (reaction object)
  (experience relation)
  (next-action subject))
