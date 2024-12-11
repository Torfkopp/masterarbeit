One branch of machine learning is the previously mentioned Deep Reinforcement Learning (DRL), which combines deep learning with reinforcement learning in order to enhance the capabilities of the learning algorithm.

==== Deep <Deep>
#figure(image("/images/coloured_neural_network.png", width: 30%), caption: [A basic representation of a neural network @network_image]) <network>

'Deep Learning' refers to the use of deep neural networks. Neural networks are models based on the human brain with multiple layers of interconnected neurons - a simple variant is displayed in @network. 
Neurons are either part of the input, hidden, or output layer. The former layer gets the data given to the network, whilst the latter layer outputs the result of the network. The hidden layers are for the calculation of the result and are not seen by the user of the network, thus the name 'hidden'. The amount of layers in a network is referred to as 'depth' of the network, which is also the reason for the name 'deep learning'. \
Each neuron has at least one input as well as one output connection. The output of the neuron is based on its input(s) and its inherent function. Each connection between two neurons holds a weight by which the output of the one neuron is multiplied with and the result then is given to the other neuron as input. Changing the weights of the network leads to a change in the result; fine-tuning weights to get a desirable result for every input is the goal of the deep learning algorithms. @anderson1995introduction

==== Reinforcement
As mentioned in @machine_learning, 'Reinforcement Learning' is one of the learning paradigms of machine learning. In Reinforcement Learning, the agent learns to make decisions by performing actions in an environment to maximise some notion of cumulative reward. Reinforcement learning is inspired by behavioural psychology and involves the agent learning from the consequences of its actions, rather than from being told explicitly what to do. The agent receives feedback in the form of rewards or penalties, which it uses to adjust its actions to achieve the best long-term outcomes.

#figure(image("/images/rl_loop.png", width: 50%), caption: [The feedback-loop of reinforcement learning algorithms @barto2004intrinsically]) <loop>

In @loop, the standard feedback loop for a reinforcement learning algorithm is illustrated. An agent gets the current state of the environment, which it uses to decide upon actions. These actions and their effect on the environment are evaluated by the critic and handed to the agent along the environment's state. By using the reward to determine whether the proposed actions were good or bad, the agent is able to select the optimal actions corresponding to the highest reward  @puiutta2020explainable.

==== History (Chat GPT, if useful improve else remove)
The history of Deep Reinforcement Learning combines advancements in both reinforcement learning and deep learning.

Around the end of the last century (1980s-2000s), early work in reinforcement learning focused on developing foundational algorithms such as Q-learning and temporal difference learning. These algorithms, however, struggled with high-dimensional state spaces due to their reliance on hand-crafted features and tabular methods.

Around the 2000s, parallel advancements in deep learning, driven by increased computational power and large datasets, led to the development of powerful neural networks capable of handling complex data. Convolutional Neural Networks (CNNs) and advancements in backpropagation were pivotal.

The integration of deep learning with reinforcement learning began to take shape around 2013, leading to the emergence of DRL. A seminal moment was the introduction of the Deep Q-Network (DQN) by researchers at DeepMind in 2013. DQN combined Q-learning with convolutional neural networks to play Atari games at superhuman levels, demonstrating the potential of DRL. This success spurred a wave of research and applications, leading to more sophisticated DRL algorithms like Deep Deterministic Policy Gradients (DDPG), Asynchronous Advantage Actor-Critic (A3C), and Proximal Policy Optimisation (PPO).

==== Abilities of DRL
Deep Reinforcement Learning stands out for several reasons: \
Firstly, it is able to handle high-dimensional data; DRL can process and learn from high-dimensional data inputs, such as images and videos, directly from raw pixels, without requiring manual feature engineering. \
It is also capable of end-to-end learning; DRL frameworks can learn policies directly from input to output in an end-to-end manner. This holistic approach streamlines the process of training agents to perform complex tasks. \
Scalability is another specialty of DRL; The use of deep neural networks enables DRL to scale to problems with vast state and action spaces, which were previously infeasible with traditional reinforcement learning methods. @arulkumaran2017deep \
Furthermore, DRL has been successfully applied to a wide range of real-world problems, including robotics, autonomous driving, game playing, finance, and healthcare. Notable achievements include AlphaGo defeating human champions in Go and DRL agents excelling in complex video games and simulations. @silver2016mastering
And lastly, DRL agents can continuously learn and adapt to changing environments, making them suitable for dynamic and uncertain scenarios where the environment evolves over time. @arulkumaran2017deep
