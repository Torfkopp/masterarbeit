= Experiment setup

Eight experiments were conducted to test the performance of the NAS methods.
Two different scenarios were used, each with the three different NAS approaches
as well as a baseline using the default SAC implementation without NAS.

== Scenarios

In every scenario, an AI agent is tasked with keeping the power grid stable.
A reactive power controller, realised as a muscle in palaestrAI and thus named reactive power muscle (RPM), is also present in every scenario.

=== 1. Scenario: CIGRE
This scenario uses the CIGRE Medium Voltage grid model of @rudion2006cigre, also depicted in @cigre.
The 'defender' agent is given the ARL defender objective #footnote("https://gitlab.com/midas-mosaik/midas-palaestrai/-/blob/main/src/midas_palaestrai/arl_defender_objective.py"), which considers the overall mean voltage of the grid, the agent's voltage sensor values,
as well as the number of busses in service to calculate the reward.

=== 2. Scenario: CIGRE + COHDARL
In this scenario, the grid model used is the same as in the first scenario.
The difference to the first scenario is the usage of COHDARL.
COHDARL is a distributed heuristic that applies self-organization mechanisms to optimize a global, shared objective.
It is used to optimize the scheduling of energy resources in virtual power plants and
operates by representing each distributed energy resource as a self-interested agent, allowing both global scheduling objectives and individual local objectives to be efficiently integrated into a distributed coordination paradigm @hinrichs2017distributed.
Consistent with the usage of COHDARL, the 'defender' agent is given the COHDARL defender objective #footnote("https://gitlab.com/midas-mosaik/midas-palaestrai/-/blob/main/src/midas_palaestrai/cohdarl_defender_objective.py"), whose reward is calculated based on the global objective of COHDARL.

== Parameters

The experiment's parameters are shown in @exp_paras and the whole experiment file can be found #link("https://gitlab.com/arl2/harl/-/blob/nas/src/harl/sac/nas/experiments/NAS-Experiment_run-0.yml?ref_type=heads")[in the 'nas'-branch of harl].
Every scenario is run for ten episodes, each representing one year, which is equivalent to 31,536,000 seconds.
A step size of 900 seconds is used, resulting in 35,040 steps per episode.
As reward function, the ExtendedGridHealthReward #footnote("https://gitlab.com/midas-mosaik/midas-palaestrai/-/blob/main/src/midas_palaestrai/rewards.py#L88"),
a reward based on the grid's "healthiness" -- meaning the deviation from the best possible status --, is used.

The parameters for SAC shown in @sac_paras are mostly kept to the default values of the implementation.
In the baseline experiment, the muscle's `start_steps`-parameter, 
which determines the number of random actions taken before SAC chooses the actions, 
plus the `update_after`-parameter, which determines the amount of steps taken before SAC starts to learn,
are both set to `1000`.
During the experiments with NAS, both parameters are set to `0`.
This is because the NAS methods have their own way of exploring the search spaces
and thus do not need the random actions taken by SAC.
The `batch_size`-parameter, which determines the size of the minibatches for SAC's stochastic gradient descent, 
is set to 1000 in the baseline experiment and kept this way for the NAS experiments, to have similar learning as the baseline after NAS finishes.
`fc_dims`, determining the size of the fully connected layers, is set to `[48, 48]` in the baseline experiment;
this parameter is adopted for the NAS experiments, but has no influence on the NAS methods since they each use their own networks.

The parameters for the NAS methods are shown in @neat_paras, @rl_paras, and @bo_paras.
They are mostly kept to the default values of their implementations.
NEAT's threshold is increased to a value of 1000, whilst the number of generations is set to 30.
This increase to an unreachable threshold is done to ensure that NEAT finishes 
after the maximum number of generations is reached and not finishing early due to a genome exceeding the threshold,
because a good value for the threshold was not known before starting the experiments.
The RL approach's `INDEX_TO_ACTION`-dictionary was expanded with additional values for the hidden sizes to allow for bigger networks.

Parameters that were established for this thesis's implementation like NEAT's `runs_per_genome` or RL's `runs_per_network`
as well as parameters like BO's `N_ITER` that define the algorithm's duration were adapted to the experiment's runtime and scaled accordingly.


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