= Introduction
Over the last years, agent systems and especially Multi-Agent Systems (MASs) @veith2017universal @frost2020robust 
@hinrichs2017distributed @mahela2020comprehensive have emerged as one of the
important tools to facilitate management of complex energy
systems. As swarm logic, they can handle numerous tasks,
such as maintaining real power equilibria, voltage control, or
automated energy trading @holly2020flexibility. The fact that MASs implement
proactive and reactive distributed heuristics allows to analyze
their behaviour and give certain guarantees, a property that has
helped in their deployment.
However, modern energy systems have also become valuable
targets. Cyber-attacks have become more common @hamilton2016lights @aflaki2021hybrid, and
establishing local energy markets, although being an attractive
concept of self-organization, can also be to manipulation, e. g.,
through artificially created congestion @wolgast2021towards. Attacks on power
grids are no longer carefully planned and executed, but also
learned by agents, such as market manipulation or voltage
band violations @veith2022learning. Thus, carefully designing software systems
that provide protection against a widening field of adversarial
scenarios have become a challenge, especially considering that
complex, inter-connected Cyber-Physical Systems (CPSs) are
inherently exploitable due to their complexity itself @hanseth2007risk.
Learning agents, particularly those based on Deep Reinforcement Learning (DRL), have
gained traction as a potential solution: If a system faces
unknown unknowns, a learning agent can devise strategies
against it. In the past, researchers have published using
DRL-based agents for numerous tasks related to power grid
operations—e.g. voltage control @diao2019autonomous—, but the approach
to use DRL for general resilient operation is relatively new
@fischer2018adversarial @veith2019analyzing. DRL—the notion of an agent with sensors and
actuators that learns by “trial and error”—is at the core of
many noteworthy successes, such as MuZero @schrittwieser2020mastering, with modern
algorithms such as Twin-Delayed DDPG (TD3) @fujimoto2018addressing, Proximal
Policy Gradient (PPO) @schulman2017proximal, and Soft Actor Critic (SAC) @haarnoja2018soft
having proved to be able to tackle complex tasks.
All modern DRL use deep Artificial Neural Networks
(ANNs) at least for the policy (or multiple, e.g. for the critic).
Actual parameter optimisation is commonly done with gradient
descent algorithms. However, these ANNs’ architectures still
need to be provided by the user, in addition to the hyperparameters
of the algorithm,
which in itself has some disadvantages:\
The user may not have the extensive knowledge
in the field of machine learning needed to optimise
the network's architecture and hyperparameters.
This may lead to the user choosing by themself
or staying with the standard parameters, which are not adapted
to the current task. Both cases can result in a subpar choice of
hyperparameters and architecture, thus leading to an unsatisfying
result since theses settings have a severe influence on the
performance and quality of the learning, as shown e.g. by @probst2019tunability.
Additionally, because the agents are part of a critical infrastructure,
the choice of hyperparameters and architecture has to be reasoned upon.
\
The goal of this work is thus to establish an algorithm 
to chose the architectures and hyperparameters
for the machine learning algorithm automatically, 
in order to always have a good choice without the need for user input,
which solves the problems stated above.
