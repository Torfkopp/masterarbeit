= Experiment setup

- 8 Experiments in total
  - 2 different scenarios
  - 4 different algorithms (base, NEAT, RL, BO)
- Experiments:
  - Base + CIGRE
  - NEAT + CIGRE
  - RL + CIGRE
  - BO + CIGRE
  - Base + COHDARL + CIGRE
  - NEAT + COHDARL + CIGRE
  - RL + COHDARL + CIGRE
  - BO + COHDARL + CIGRE

== Scenarios

=== CIGRE

=== CIGRE + COHDARL

== Parameters

...

/* Old version with bhv
In total, 16 different experiments were conducted:
Every NAS method as well as a baseline were tested in four different scenarios.
  
== Scenarios
In every scenario, the ai agent is tasked with keeping the power grid stable.
A reactive power controller, realised as a muscle in palaestrAI and thus named reactive power muscle (RPM), is also present in every scenario.
The four scenarios differ in the grid model used and the usage of COHDARL.
COHDARL is a distributed heuristic that applies self-organization mechanisms to optimize a global, shared objective.
It is used to optimize the scheduling of energy resources in virtual power plants and
operates by representing each distributed energy resource as a self-interested agent, allowing both global scheduling objectives and individual local objectives to be efficiently integrated into a distributed coordination paradigm @hinrichs2017distributed.

#emph[Scenario 1: CIGRE + RPM] \
As a grid model, the CIGRE Medium Voltage grid model is used @rudion2006cigre; a model is depicted in @cigre.

#emph[Scenario 2: CIGRE + RPM + COHDARL] \
Same as scenario 1, but with the addition of COHDARL.

#emph[Scenario 3: BHV + RPM] \
Like scenario 1, but instead of the CIGRE model, a model of Bremerhaven's Medium Voltage grid is used.

#emph[Scenario 4: BHV + RPM + COHDARL] \
Like scenario 2, but with the BHV model.

== Parameters and Settings
Every scenario is run for ten episodes à one year, which is equivalent to 31,536,000 seconds.
A step size of 900 seconds is used, resulting in 35,040 steps per episode.
As reward function, the ExtendedGridHealthReward #footnote("https://gitlab.com/midas-mosaik/midas-palaestrai/-/blob/main/src/midas_palaestrai/rewards.py#L88"),
a reward based on the grid's 'healthiness' rather the deviation from the best possible status, is used.
The whole experiment file used can be found xxx.

SAC is ... \
The parameters used for the algorithms are kept similar to the original implementations mentioned in @implementation.

Tabular display of the parameters can also be found in #link(<appendix>)[the appendix].
*/


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