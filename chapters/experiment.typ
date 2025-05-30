= Experiment setup

Eight 'experiments' were conducted to test the performance of the NAS methods.
Two different scenarios were used, each with the three different NAS approaches
as well as a baseline using the default SAC implementation without NAS.

== Scenarios

In every scenario, an AI agent is tasked with keeping the power grid stable.
A reactive power controller, realised as a muscle in palaestrAI and thus named reactive power muscle (RPM), is also present in every scenario.

=== 1#super[st] Scenario: CIGRE

#figure(image("/images/cigre.png", width: 80%), caption: [CIGRE benchmark grid used @rudion2006cigre]) <cigre>

This scenario uses the CIGRE Medium Voltage grid model of @rudion2006cigre, also depicted in @cigre.
The 'defender' agent is given the ARL defender objective #footnote("https://gitlab.com/midas-mosaik/midas-palaestrai/-/blob/main/src/midas_palaestrai/arl_defender_objective.py"), which adds the overall mean voltage of the grid, the agent's voltage sensor values,
as well as the number of buses in service together, each with a coefficient of $1/3$ by default, to calculate the reward.

=== 2#super[nd] Scenario: CIGRE + COHDARL
In this scenario, the grid model used is the same as in the first scenario.
The difference to the first scenario is the usage of COHDARL.
COHDARL is a distributed heuristic that applies self-organisation mechanisms to optimise a global, shared objective.
It is used to optimise the scheduling of energy resources in virtual power plants and
operates by representing each distributed energy resource as a self-interested agent, allowing both global scheduling objectives and individual local objectives to be efficiently integrated into a distributed coordination paradigm @hinrichs2017distributed.
Consistent with the usage of COHDARL, the 'defender' agent is given the COHDARL defender objective #footnote("https://gitlab.com/arl-experiments/cohdarl/-/blob/main/src/cohdarl/cohdarl_objective.py"), whose reward is based on the global objective of COHDARL. The objective calculates its reward just like the ArlDefenderObjective, just with the addition of the COHDARLS's power objective and a coefficient of $1/4$ for each of the summands.

== Parameters

The palaestrAI framework allows creating schedules of experiments -- so-called phases -- to start directly after one another with one command.
Thus, an experiment for each of the two scenarios was conducted 
with the four different methods (Baseline, BO, NEAT, RL) being phases of it.

The experiment #footnote("https://gitlab.com/arl2/harl/-/blob/nas/src/harl/sac/nas/experiments/NAS-Exp-TS.yml") for the first scenario is run for three episodes, each representing a hundred days, which is equivalent to 8,640,000 seconds.
A step size of 900 seconds is used, which results in 5,760 steps per episode
-- since the palaestrAI simulation starts at around 40% of the total steps for experiments with timeseries --
or 17,280 steps for the whole simulation.
As reward function of the environment, the ExtendedGridHealthReward #footnote("https://gitlab.com/midas-mosaik/midas-palaestrai/-/blob/main/src/midas_palaestrai/rewards.py#L88"),
a reward based on the grid's "healthiness" -- meaning the deviation from the best possible status --, is used.
It is a vectorised reward giving complete information about the net by encompassing the
minimum, maximum, mean, median, and standard deviation of the values of the voltage bands and line loads as well as the number of 
buses in service and out of service. Each value is provided as a separate reward information with a corresponding id.

The second scenario's experiment #footnote("https://gitlab.com/arl2/harl/-/blob/nas/src/harl/sac/nas/experiments/NAS-Exp-TS-COHDARL.yml") uses almost the same parameters (also shown in @exp_paras) as the first scenario, but has an increased runtime of 15,000,000 seconds.

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
NEAT's threshold is increased to a value of 100,000, whilst the number of generations is set to 15.
This increase to an unreachable threshold is done to ensure that NEAT finishes 
after the maximum number of generations is reached and not finishing early due to a genome exceeding an arbitrary set threshold,
because a good value for the threshold was not known prior to starting the experiments.
The RL approach's `INDEX_TO_ACTION`-dictionary was expanded with additional values for the hidden sizes to allow for bigger networks.

Parameters that were established for this thesis's implementation like NEAT's `runs_per_genome` or RL's `runs_per_network`
as well as parameters like BO's `N_ITER` that define the algorithm's duration were adapted to the experiment's runtime and scaled accordingly.
This leads to both the RL-method and the BO-method running for a similar amount of time -- 20,000 steps in total --
with the remaining steps being run with the network that performed best during the NAS method's runtime.
The NEAT method runs for 25,000 steps in total, because it also trains the weights and 
thus does not need the amount of time to train the best net.
