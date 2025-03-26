Agent systems have become more and more important in the management of complex energy systems.
To ensure the security of these systems, it is necessary to protect them from cyber-attacks.
Learning agents, particularly those based on deep reinforcement learning (DRL), have shown great potential in this area.
All modern DRL algorithms use deep artificial neural networks (ANNs), 
whose architecture has a great influence on the performance and quality of the learning.
However, the choice of the architecture is still mostly up to the user, 
for whom the task of finding the optimal architecture for the task at hand can be challenging.
Thus, three Neural Architecture Search (NAS) algorithms were implemented to automate the choice of the architecture.
The algorithms (NEAT, Bayesian optimisation, and a reinforcement learning approach) 
were tested as agents tasked to stabilise a simulated powergrid 
in the adversarial resilience learning (ARL) architecture of the palaestrAI framework.
All three algorithms failed at learning in the task and performing better than the baseline, which
suggests a faulty implementation or a too complex task for these NAS algorithms.
