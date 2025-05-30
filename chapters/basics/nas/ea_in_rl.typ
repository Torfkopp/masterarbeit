== Evolutionary algorithms in Reinforcement Learning

Several surveys attend to the combination of evolutionary algorithms and deep reinforcement learning:

@parker2022automated talks about reinforcement learning in the context of automated machine learning and which methods currently exist.
As already mentioned, the success of machine learning depends on the design choices like the topology of the network or the hyperparameters of the algorithm. The field of automated machine learning tries to automate these design choices to maximise success. Automated reinforcement learning (AutoRL) is a branch of automated machine learning which focuses on the improvement and automation of reinforcement learning algorithms. The survey shows that the evolutionary approach is possible and was done for NeuroEvolution and HPO, both of which are part of the undertaking in this paper. For the former, _NEAT_ @stanley2002efficient and _HyperNEAT_ @stanley2009hypercube are mentioned as working solutions, whilst for the HPO variants of the _Genetic Algorithm_ (GA) @mirjalili2019genetic, _Whale Optimisation_ @mirjalili2016whale, _online meta-learning by parallel algorithm competition_ (OMPAC) @elfwing2018online, and _population based training_ (PBT) @jaderberg2017population were successfully used.

@bai2023evolutionary covers several uses cases and research fields of _Evolutionary reinforcement learning_, like policy search, exploration, and HPO. According to the survey, HPO in RL faces several challenges. However, the challenges, namely extremely expensive performance, too complex search spaces, and several objectives, can be addressed by using evolutionary algorithms instead.
The algorithms for the latter are put into three categories: Darwinian, like GAs,; Lamarckian, like PBT and its variations (FIRE PBT @dalibard2021faster, SEARL @franke2020sample); and combinations of both evolutionary methods, like an evolutionary stochastic gradient descent (ESGD) @cui2018evolutionary.

@Sigaud focuses on using evolutionary algorithms for policy-search, but also has a section for HPO, in which several different algorithms are mentioned, such as PBT and SEARL.

#figure(
    image("/images/basics/ea_in_rl.png", width: 70%),
    caption: [How a evolutionary algorithm is used to optimise RL @bai2023evolutionary]
) <outer_loop>

@outer_loop shows the general way an evolutionary algorithm is used to optimise a reinforcement learning algorithm.
The outer loop is the evolutionary algorithm, whose population consists of different RL agents.
These RL agents are then run in the environment and their performance is evaluated.

Most of the papers mentioned above planning to use evolutionary algorithms to optimise RL use this approach.
This, however, is not feasible for this thesis, as explained at a later point.