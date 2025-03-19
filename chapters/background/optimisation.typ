In order to get the most of machine learning algorithms, optimisation is needed.
Generally, there are two big areas that are more or less algorithm independent and whose improvement
has a big influence on the performance of the machine learning algorithm:
the algorithm's hyperparameters and the used network.

=== Hyperparameter Optimisation

Hyperparameters in machine learning are configuration settings used to control the learning process of a model. Unlike parameters that the model learns during training, such as weights in a neural network, hyperparameters are set before the training process begins and remain constant. Examples of hyperparameters include learning rate, number of epochs, batch size, and algorithm specific parameters like a gamma for a discounting function. The selection of hyperparameters significantly affects the performance and effectiveness of a machine learning model, shown e.g. in @probst2019tunability.

Hyperparameter optimisation, also known as hyperparameter tuning, refers to the process of finding the optimal set of hyperparameters for a machine learning model. This process aims to improve the model's performance on a given dataset by searching through different combinations of hyperparameters to identify the best-performing set. Effective hyperparameter optimisation can lead to better model accuracy, generalisation, and overall performance.

Several methods are used for hyperparameter optimisation. One common approach is Grid Search, which involves exhaustively searching through a manually specified subset of the hyperparameter space. This method is straightforward but can be computationally expensive, especially for large datasets or complex models.

Another popular method is Random Search, where hyperparameter values are selected randomly from a defined range. Random Search can be more efficient than Grid Search as it is not limited to a fixed grid and has a higher chance of finding a good combination in fewer iterations.

More advanced techniques include Bayesian Optimisation, which builds a probabilistic model of the function mapping hyperparameters to the objective to be optimised, and uses this model to select the most promising hyperparameters to evaluate next. This method is generally more efficient than Grid or Random Search, particularly for expensive function evaluations.

Lastly, methods like Gradient-based optimisation and evolutionary algorithms can also be applied to hyperparameter tuning, though they are less common. These methods adapt the hyperparameters iteratively based on performance feedback, either by calculating gradients (as in gradient descent) or using evolutionary strategies to evolve a population of hyperparameter sets.

For instance, in Bayesian Optimisation, an acquisition function is used to balance exploration (searching through new, unexplored hyperparameter values) and exploitation (refining the best-known hyperparameter values). This iterative process continues until a specified budget (time or computational resources) is exhausted or the performance improvement plateaus. @feurer2019hyperparameter

=== Network Optimisation and Neural Architecture Search

As already mentioned in @Deep, networks are a vital part of deep reinforcement learning algorithms. Their topology, which describes the arrangement of the neurons and how they are connected amongst each other, has a big influence on the learning performance of the algorithm  @probst2019tunability.
Automating the design of these neural networks is a challenging task that has been addressed by the field of neural architecture search (NAS). NAS aims to find the optimal network architecture for a given task without human intervention, by searching through a vast space of possible network architectures to identify the most effective design for a specific problem.

There are several approaches to NAS, ranging from reinforcement learning-based methods to evolutionary algorithms and gradient-based optimisation. Reinforcement learning-based NAS methods treat the search for network architectures as a sequential decision-making process, where the agent learns to select the best architecture based on rewards obtained from evaluating different architectures. These methods can be computationally expensive due to the large search space and the need for extensive training and evaluation of architectures. \
Gradient-based optimisation such as Bayesian optimisation or gradient descent can also be used for NAS, where the network architecture is treated as a continuous space that can be optimised using gradient-based methods. However, the high-dimensional and discrete nature of network architecture search makes gradient-based methods challenging to apply directly. \
Amongst the evolutionary-based approaches to NAS are algorithms like NEAT (NeuroEvolution of Augmenting Topologies) @NEAT, which evolve neural network topologies and weights simultaneously. These are known under the TWEANN (Topology and Weight Evolving Artificial Neural Networks) moniker.
Roughly, these TWEANN-algorithms will create a population of networks with different topologies and weights, whose individual networks will, based on their fitness to the task, either be removed or used as an basis for the next generation. This way, a network with optimal fit to the task will be found. @white2023neural
