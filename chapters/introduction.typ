= Introduction
In recent years, agent systems, and in particular multi-agent systems (MAS) @veith2017universal @frost2020robust 
@hinrichs2017distributed @mahela2020comprehensive,
have emerged as one of the most important tools to facilitate the management of complex energy systems.
As swarm logic, they can perform a wide range of tasks,
such as maintaining real power balances, voltage control or automated energy
automated energy trading @holly2020flexibility. The fact that MASs implement
proactive and reactive distributed heuristics, their behaviour can be analysed and
to analyse their behaviour and provide certain guarantees, a feature that has helped their deployment.
However, modern energy systems have also become valuable
targets. Cyber-attacks have become more common @hamilton2016lights @aflaki2021hybrid, and
while the establishment of local energy markets is an attractive concept
of self-organisation, can also be open to manipulation, for example through
through artificially created congestion @wolgast2021towards. Attacks on power
networks are no longer carefully planned and executed, but also
learnt by agents, e.g. market manipulation or voltage
violations @veith2022learning. The careful design of software systems
against a widening field of adversarial scenarios has become a challenge.
scenarios has become a challenge, especially given the
complex, interconnected cyber-physical systems (CPSs) are
inherently exploitable by their very complexity @hanseth2007risk.
Learning agents, particularly those based on Deep Reinforcement Learning (DRL), have gained
as a potential solution: When a system with
faced with unknown unknowns, a learning agent can develop strategies to
against them. In the past, researchers have used
DRL-based agents for many tasks related to power system
operations - e.g. voltage control @diao2019autonomous - but the approach of using
DRL for general resilient operation is relatively new.
@fischer2018adversarial @veith2019analyzing.
DRL -- the idea of an agent with sensors and
and actuators that learns by trial and error -- is at the heart of many notable successes, such as MuZero @schrittwieser2020mastering, with modern algorithms such as
such as Twin-Delayed DDPG (TD3) @fujimoto2018addressing, Proximal Policy Gradient (PPO) @schulman2017proximal, and Soft Actor Critic (SAC) @haarnoja2018soft
which have proven their ability to tackle complex tasks.
All modern DRLs use deep artificial neural networks
(ANNs) at least for the policy (or several, e.g. for the critic).
The choice of the architecture of these neural networks has a great influence on the
performance and quality of the learning, as shown e.g. by @probst2019tunability.
But despite its importance, the choice is still mostly up to the user,
which in itself has some disadvantages:
The user may not have the extensive knowledge
in the field of machine learning needed to optimise
the network's architecture; thus the user may choose by themself
or stay with the standard parameters, which are not adapted
to the current task. Both cases can result in a subpar choice of a
architecture, thus leading to an unsatisfying result.
Additionally, because the agents are part of a critical infrastructure,
the choice of architecture has to be reasoned upon.

A solution to the problem may be to automate the choice of the architecture
by the use of neural architecture search (NAS) algorithms, which have shown its
worth in the field of machine learning, but mostly for image recognition tasks @elsken2019neural @liu2021survey.
This approach may be adaptable to agents tasked to stabilise the powergrid
as part of the adversarial resilience learning (ARL) approach.

This leads to this work's hypothesis that 
choosing a neural network's architecture can be automated with a NAS algorithm, which
does this task in a way that improves upon the performance of a user-picked architecture
in a reasonable amount of time in the ARL architecture.
