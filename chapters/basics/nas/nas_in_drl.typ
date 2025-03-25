== Neural Architecture Search

Neural Architecture Search (NAS) is a field of research that aims to automate the design of neural network architectures. The goal is to find the optimal network topology for a given task without human intervention, by searching through a vast space of possible network architectures to identify the most effective design for a specific problem. NAS has gained significant attention in recent years due to its potential to improve the performance and efficiency of deep learning models.
NAS has been a popular research topic in recent years, as @white2023neural could accumulate over 1000 papers on that topic in just two years.

Networks are a vital part of deep reinforcement learning algorithms. Their topology, which describes the arrangement of the neurons and how they are connected amongst each other, has a big influence on the learning performance of the algorithm @probst2019tunability.
Automating the design of these neural networks is a challenging task that has been addressed by the field of neural architecture search (NAS). NAS aims to find the optimal network architecture for a given task without human intervention, by searching through a vast space of possible network architectures to identify the most effective design for a specific problem.

There are several approaches to NAS, ranging from reinforcement learning-based methods to evolutionary algorithms and gradient-based optimisation. 
Reinforcement learning-based NAS methods treat the search for network architectures as a sequential decision-making process, where the agent learns to select the best architecture based on rewards obtained from evaluating different architectures. These methods can be computationally expensive due to the large search space and the need for extensive training and evaluation of architectures. \
Gradient-based optimisation such as Bayesian optimisation (BO) or gradient descent can also be used for NAS, where the network architecture is treated as a continuous space that can be optimised using gradient-based methods. However, the high-dimensional and discrete nature of network architecture search makes gradient-based methods challenging to apply directly. @white2023neural

Evolutionary algorithms can also be used to search for optimal network architectures as shown by;
however, most of the existing papers on EAs in NAS focus on image classification tasks @liu2021survey.
This focus is also true for the papers on NAS as a whole @elsken2019neural.

=== NAS in DRL

Using reinforcement learning for neural architecture search has been done for a long time
and thus has been heavily researched @white2023neural.
The other way around -- using neural architecture search to improve reinforcement learning --
is, however, not common. 
@elsken2019neural argues that even though many authors optimised some architectural choices of deep reinforcement learning algorithms, a full study of NAS for RL is still missing.
One of the works trying to use NAS in DRL is @fu2020auto, which introduces a framework that optimises
their DRL agent through NAS. The authors argue that their framework outperforms
manually designed DRL in both test scores and effiecency, potentially opening up new possibilities for automated and fast development of DRL-powered solutions for real-world applications.
Another paper that uses NAS to improve DRL is @mazyavkina2021optimizing.
In which the authors -- similar to the other paper -- report that modern NAS methods successfully find architectures for RL agents that outperform manually selected ones and that this suggests that automated architecture search can be effectively applied to RL problems, potentially leading to improved performance and efficiency in various RL tasks.

\
\
The author of this thesis reckons that the approach of using an evolutionary algorithm to search the neural architecture
an inner loop of a DRL algorithm is unique and only done by a few.
This uniqueness is only elevated by using the learning algorithm in the adversarial resilience learning @fischer2018adversarial context,
as an agent in a simulated powergrid.