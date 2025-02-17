= Experiment setup
- 16 different experiments
  - 4 scenarios x (3 NAS methods + baseline)
  
== Scenarios

#emph[Scenario 1: CIGRE + RPM] \
As a grid model, the CIGRE Medium Voltage grid model is used @rudion2006cigre. The model is depicted in @cigre.
A Reactive Power Muscle (RPM) is used to control the grid.

#emph[Scenario 2: CIGRE + RPM + COHDARL] \
Same as scenario 1, but with the addition of COHDARL.
COHDARL is ...

#emph[Scenario 3: BHV + RPM] \
Like scenario 1, but instead of the CIGRE model, a model of Bremerhaven's Medium Voltage grid is used.

#emph[Scenario 4: BHV + RPM + COHDARL] \
Like scenario 2, but with the BHV model.

== Parameters

- Tabellen einfügen



/*For the experiments, four different scenarios are used:
+ CIGRE + RPM
+ CIGRE + RPM + COHDARL
+ BHV + RPM
+ BHV + RPM + COHDARL

=== Cigre
The two CIGRE scenarios are based on the CIGRE Medium Voltage grid model @rudion2006cigre, depicted in @cigre.

=== BHV
The other two BHV scenarios are based on a model of Bremerhaven's Medium Voltage grid.

=== RPM
Reactive Power Muscle #footnote("Hier link zum RPM")
A Reactive power controller in arl
- Reactive Power erklären

=== COHDARL
COHDARL#footnote("https://gitlab.com/arl-experiments/cohdarl") is the use of COHDA in ARL.
COHDA (Combinatorial Optimisation Heuristic for Distributed Agents) is a fully distributed heuristic designed for scheduling energy resources in Virtual Power Plants (VPPs). It operates by representing each Distributed Energy Resource (DER) as a self-interested agent, allowing both global scheduling objectives and individual local objectives to be efficiently integrated into a distributed coordination paradigm @hinrichs2017distributed.
=== Parameters

== Algorithm setup

=== NEAT

=== RL

=== BO

Experiments:
- 16 Experiments -> 4x4
  - CIGRE + RPM
  - CIGRE + RPM + COHDARL
  - BHV + RPM
  - BHV + RPM + COHDARL
- x
  - Baseline/Normal (Nicht von mir)
  - NEAT
  - RL
  - BO

- Table of Experiment parameters
- Table of Algorithm parameters

COHDARL
https://www.researchgate.net/profile/Eric-Veith/publication/385204470_Cover_Me_Safeguarding_Multi-Agent_Systems_with_Deep_Reinforcement_Learning_for_Resilient_Grid_Operation/links/671a1016edbc012ea13c69d4/Cover-Me-Safeguarding-Multi-Agent-Systems-with-Deep-Reinforcement-Learning-for-Resilient-Grid-Operation.pdf
- COHDA, presented @hinrichs2017distributed, is a fully distributed heuristic that applies self-organization mechanisms to optimize a global, shared objective.
- COHDARL is the use of COHDA in ARL (https://gitlab.com/arl-experiments/cohdarl)

CIGRE
https://arxiv.org/pdf/2204.11352
#figure("images/cigre.png")
- The model used is a CIGRE Medium Voltage grid model as shown in \#figure. @cigre
*/