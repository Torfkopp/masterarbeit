== Deep Reinforcement Learning

One branch of machine learning (@ai_venn) is the previously mentioned Deep Reinforcement Learning (DRL), which combines deep learning with reinforcement learning in order to enhance the capabilities of the learning algorithm.

=== Deep Learning <Deep>
#figure(image("/images/neural_network.png", width: 30%), caption: [A basic representation of a neural network #footnote("https://commons.wikimedia.org/wiki/File:Ann_dependency_(graph).svg")]) <network>

'Deep Learning' refers to the use of deep neural networks. Neural networks are models based on the human brain with multiple layers of interconnected neurons -- a simple variant is displayed in @network.
Neurons are either part of the input, hidden, or output layer. The former layer gets the data given to the network, whilst the latter layer outputs the result of the network. The hidden layers are for the calculation of the result and are not seen by the user of the network, thus the name 'hidden'. The amount of layers in a network is referred to as 'depth' of the network, which is also the reason for the name 'deep learning'. \
Each neuron has at least one input as well as one output connection. The output of the neuron is based on its input(s) and its inherent function. Each connection between two neurons holds a weight by which the output of the one neuron is multiplied with and the result then is given to the other neuron as input. Changing the weights of the network leads to a change in the result; fine-tuning weights to get a desirable result for every input is the goal of the deep learning algorithms. @anderson1995introduction

#figure(image("/images/neuron_math.PNG", width: 30%), caption: [A representation of single hidden neuron with its inputs @heaton2011introduction]) <neuron_math>

The formula to calculate a neurons output generally is:
$ h_1 = A(sum_(c=1)^n (i_c * w_c) ) $

with $h_1$ being the output of the neuron, \
$A$ being the activation function, \
$i_c$ being the output of the previous neuron $I$, \
$w_c$ being the weight of the connection, \
and $n$ the amount of connections.

#figure(image(("/images/common_activation_functions.png"), width: 50%), caption: [A selection of common activation functions with their formula #footnote("https://machine-learning.paperspace.com/wiki/activation-function")]) <activation_functions>
Some common activation functions are displayed in @activation_functions. Activation functions determine the output of a neuron and are used to
introduce non-linearity to the neural network, thus making it capable of learning non-linear functions. @heaton2011introduction

This way, every neuron calculates its output according to the formula and passes its output to the next neuron. 
With the output of the last neuron being the result of the network.

It has been shown that "multilayer feedforward networks are universal approximators". This means that any measurable function can be approximated to any desired degree of accuracy. A lack of success is due to inadequate learning, insufficient number of hidden units, or the lack of a deterministic relationship between input and target.@hornik1989multilayer

=== Reinforcement Learning

As mentioned in @machine_learning, 'Reinforcement Learning' is one of the learning paradigms of machine learning. In Reinforcement Learning, the agent learns to make decisions by performing actions in an environment to maximise some notion of cumulative reward. Reinforcement learning is inspired by behavioural psychology and involves the agent learning from the consequences of its actions, rather than from being told explicitly what to do. The agent receives feedback in the form of rewards or penalties, which it uses to adjust its actions to achieve the best long-term outcomes.

#figure(image("/images/rl_loop.png", width: 50%), caption: [The feedback-loop of reinforcement learning algorithms #footnote("https://commons.wikimedia.org/wiki/File:Reinforcement_learning_diagram.svg")]) <loop>

In @loop, the general feedback loop for a reinforcement learning algorithm is illustrated.
The environment is in a state, which is observed by the agent. The agent then decides upon an action, which is executed in the environment. The environment then transitions to a new state and gives feedback to the agent in the form of a reward. The agent uses this feedback to adjust its policy, which is the strategy it uses to decide upon actions. By adjusting the policy, the agent learns to take actions that maximise the rewards received. @puiutta2020explainable

==== Applications

Reinforcement learning has many applications, such as in robotics @kober2013reinforcement, finance @hambly2023recent, and for this scope most relevant the energy sector, for example as a control system for powergrids @chen2021powernet.
As shown in @perera2021applications, the application of reinforcement learning can be worthwhile, as
many publications regarding the use of it in energy systems report a 10-20% performance improvement; however, many of these publications are not using state-of-the-art algorithms and instead half of them opt for Q-learning @perera2021applications.

Another application of reinforcement learning is adversarial reinforcement learning,
Adversarial reinforcement learning is an extension of traditional reinforcement learning techniques applied to multi-agent, competitive environments.
In adversarial reinforcement learning, at least two agents interact in an environment with opposing goals, often competing in a zero-sum game where one agent's gain is the other's loss. Both agents (or all agents respectively) learn and adapt their strategies simultaneously as they interact with each other and the environment.
By learning the estimate of the value of state-action pairs, the agents may consider the opponent's potential moves. 
The agents must balance exploration of new strategies and exploitation of known effective actions to achieve their goals. @uther1997adversarial
This approach can also be brought to the energy sector.

A survey @hao2022adversarial shows the possibilities of attacking machine learning agents deployed in smart grids with adversarial machine learning.
@panimproving use the adversarial attacker to train and improve the robustness of their reinforcement learning agent controlling the power grid.
A highly related work is @fischer2018adversarial, in which adversarial resilience learning (ARL) is introduced;
agents take the roles of attackers or defenders that aim at worsening or improving---or keeping, respectively---
defined performance indicators of the system, e.g. a simulated power system, and learn to adapt their strategies to the opponent's actions.

==== Bellman Equation

A central part of reinforcement learning is the Bellman equation,
based upon Richard Bellman's principle of optimality @bellman1954theory:
#quote(attribution: [Richard Bellman], block: true)["An optimal policy has the property that whatever the initial state and initial decision are, the remaining decisions must constitute an optimal policy with regard to the state resulting from the first decision."]

That means that the optimal policy consists of always picking the optimal action in a given state.

The Bellman equation can be defined as:
$ V^pi^*(x) = max_a [Re_x(a) + gamma sum_(y)P_"xy" (a)V^pi^*(y)] $

Where: \
$x$ is the state, $y$ a possible next state, $a$ an action, $pi$ the policy, \
$V$ the value of a state, which is the long-term reward for being in that state, \
$Re_x(a)$ the immediate reward for taking action $a$ in state $x$, and \
$P_"xy" (a)$ the probability of transitioning to state $y$ from state $x$ by taking action $a$.

In order for a reinforcement learning agent to have an optimal policy, it has the task to
find a policy~$pi$ that maximises the total expected reward when in state~$x$.
The total expected reward is the immediate reward~$Re_x(a)$ received by taking action~$a$ plus the sum of all
values~$V$ of the possible next states~$y$ multiplied by the probability~$P_"xy"$
of reaching that state~$y$ from current state~$x$ by taking the action~$a$.
The sum is discounted by a factor $gamma$ (0 < $gamma$ < 1), 
which determines the importance of future rewards compared to the immediate reward. 

This way, by always taking the path with the highest expected reward, 
an agent is said to be able to find the optimal policy.

==== On-policy -- Off-Policy

There are mainly two different approaches to reinforcement learning: on-policy and off-policy learning.
On-Policy algorithms evaluate and improve the same policy that is also used to select actions.
Off-Policy algorithms, however, have two different policies:
the behaviour policy that is used to select actions and the target policy that is learned and improved.
The former concept is a straightforward and simple way to learn a neural network policy.
They also tend to be more stable and due to the simpleness easier to implement and use.
A major drawback of on-policy algorithms is that they are inclined to be data inefficient,
because they look at each data point only once. 
Not being able to reuse data points makes them unable to learn from past experiences, too.
Off-Policy algorithms, on the other hand, use a memory replay buffer to store and reuse samples.
This way, data effiency is improved, but often at a cost in stability and ease of use. @gu2017interpolated

==== Q-Learning

An early off-policy reinforcement learning algorithm that uses the Bellman equation is Q-learning @watkins1992q.
It defines Q values (or action-values) for a policy $pi$:
$ Q^pi (x, a) = Re_x(a) + gamma  sum_y P_"xy" [pi(x)] V^pi (y) $

Meaning, the Q value is the expected discounted reward for executing action $a$ at state $x$ and following policy $pi$ therafter.
Theoretically, by using the policy to always take the action with the highest Q value, the Q-learning agent is able to find the optimal policy.
In Q-learning, the agent has a set of acts that it repeats during so called episodes:
in the nth episod, the agent:
+ observes its current state $x_n$
+ selects and performs an action $a_n$
+ observes the following state $y_n$
+ receives an immediate reward $r_n$
+ adjusts its $Q_"n-1"$ values using a learning factor $alpha_n$, according to
  $ Q_n (x,a) = cases(
    (1-alpha_n) Q_"n-1" (x, a) + alpha_n [r_n + gamma V_"n-1" (y_n)] & "if" x = x_n "and" a = a_n",",
    Q_"n-1" (x, a) & "otherwise,"
  ) $
  where
  $V_"n-1" (y) eq.triple max_b { Q_"n-1" (y, b)} $
  is the best the agent thinks it can do from state $y$. 
  
To represent the Q values $Q_n (x, a)$, the algorithm uses a look-up table since other representations may not converge correctly. @watkins1992q

==== Deep Q-Network

An advancement of Q-learning is Deep Q-Network (DQN) @mnih2015human,
which combines Q-Learning with deep neural networks.
Instead of the look-up table representation, DQN uses a neural network to approximate the optimal Q values:
$ Q^*(s,a) = max_a EE[r_t + gamma r_"t+1" + gamma^2 r_"t+2" + ... |s_t = s, a_t = a, pi] "," $
which is the maximum sum of rewards $r_t$ discounted by $gamma$ at each time step $t$,
achievable by a behaviour policy $pi = P(a|s)$, after making an observation ($s$) and taking an action ($a$).

It stores samples of experience ($s_t$, $a_t$, $r_t$, $s_"t+1"$) in a replay buffer at each time-step $t$ in a data set $D_t = {e_1, ..., e_t}$.
The Q-learning updates are applied on samples of experience drawn uniformly at random from the replay buffer.

The loss function, a function that measures the difference between the predicted and the actual target values, 
to quantify how well or poor the model has performed and to update the parameters of the neural network, is defined as:

$ cal(L)(theta) = EE_((s,a,r,s')~cal(D))[(r + gamma max_a' Q_"target" (s', a'; theta_i^-) - Q(s, a; theta))^2] $

in which $gamma$ is the discount factor determining the agent's horizon, $theta_i$ are
the parameters---or rather weights---of the Q-network at iteration $i$ and $theta_i^-$ are the network
parameters used to compute the target at iteration $i$.
The target network's weights $theta_i^-$ held fixed between individual updates and are only
updated with the Q-network's parameters ($theta_i$) at fixed intervalls. @mnih2015human

==== Deep Deterministic Policy Gradients
// https://www.perplexity.ai/search/545d9424-67e3-432f-aa3c-b825bc357970
// https://spinningup.openai.com/en/latest/algorithms/ddpg.html
// 
==== TD3
// https://spinningup.openai.com/en/latest/algorithms/td3.html

==== SAC
// https://spinningup.openai.com/en/latest/algorithms/sac.html