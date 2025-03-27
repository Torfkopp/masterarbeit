#import "/images/diagrams.typ": feed_loop, neurons
== Deep Reinforcement Learning

One branch of machine learning (@ai_venn) is the previously mentioned Deep Reinforcement Learning (DRL), which combines deep learning with reinforcement learning in order to enhance the capabilities of the learning algorithm.

=== Deep Learning <Deep>
#figure(image("/images/basics/neural_network.png", width: 30%), caption: [A basic representation of a neural network #footnote("https://commons.wikimedia.org/wiki/File:Ann_dependency_(graph).svg")]) <network>

'Deep Learning' refers to the use of deep neural networks. Neural networks are models based on the human brain with multiple layers of interconnected neurons -- a simple variant is displayed in @network.
Neurons are either part of the input, hidden, or output layer. The former layer gets the data given to the network, whilst the latter layer outputs the result of the network. The hidden layers are for the calculation of the result and are not seen by the user of the network, thus the name 'hidden'. The amount of layers in a network is referred to as 'depth' of the network, which is also the reason for the name 'deep learning'. \
Each neuron has at least one input as well as one output connection. The output of the neuron is based on its input(s) and its inherent function. Each connection between two neurons holds a weight by which the output of the one neuron is multiplied with and the result then is given to the other neuron as input. Changing the weights of the network leads to a change in the result; fine-tuning weights to get a desirable result for every input is the goal of the deep learning algorithms. @anderson1995introduction

#figure(
  scale(70%, reflow: true)[#neurons],
  //image("/images/basics/neuron_math.PNG", width: 30%), 
  caption: [A representation of single hidden neuron with its inputs]
) <neuron_math>

The node H1 in @neuron_math has three inputs: I1, I2, and B1. I1 and I2 are simply the input values that the neural network was provided with to compute the output.
B1 is a bias neuron and thus always 1. Bias neurons allow the output of the activation function to be shifted to the left or right on the x-axis.

The formula to calculate a neurons output generally is:
$ h_1 = A(sum_(c=1)^n (i_c * w_c) ) $

with $h_1$ being the output of the neuron, \
$A$ being the activation function, \
$i_c$ being the output of the previous neuron $I$, \
$w_c$ being the weight of the connection, \
and $n$ the amount of connections.

#figure(image(("/images/basics/common_activation_functions.png"), width: 50%), caption: [A selection of common activation functions with their formula #footnote("https://machine-learning.paperspace.com/wiki/activation-function")]) <activation_functions>
Some common activation functions are displayed in @activation_functions. Activation functions determine the output of a neuron and are used to
introduce non-linearity to the neural network, thus making it capable of learning non-linear functions. @heaton2011introduction

This way, every neuron calculates its output according to the formula and passes its output to the next neuron. 
With the output of the last neuron being the result of the network.

It has been shown that "multilayer feed-forward networks are universal approximators". This means that any measurable function can be approximated to any desired degree of accuracy. A lack of success is due to inadequate learning, insufficient number of hidden units, or the lack of a deterministic relationship between input and target.@hornik1989multilayer

=== Reinforcement Learning

As mentioned in @machine_learning, 'Reinforcement Learning' is one of the learning paradigms of machine learning. In Reinforcement Learning, the agent learns to make decisions by performing actions in an environment to maximise some notion of cumulative reward. Reinforcement learning is inspired by behavioural psychology and involves the agent learning from the consequences of its actions, rather than from being told explicitly what to do. The agent receives feedback in the form of rewards or penalties, which it uses to adjust its actions to achieve the best long-term outcomes.

#figure(
  scale(70%, reflow:true)[#feed_loop], 
  caption: [The feedback-loop of reinforcement learning algorithms)]) <loop>

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
agents take the roles of attackers or defenders that aim at worsening or improving -- or keeping, respectively --
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
the behaviour policy that is used to select actions and the target policy that is learnt and improved.
The former concept is a straightforward and simple way to learn a neural network policy.
They also tend to be more stable and due to the simpleness easier to implement and use.
A major drawback of on-policy algorithms is that they are inclined to be data inefficient,
because they look at each data point only once. 
Not being able to reuse data points makes them unable to learn from past experiences, too.
Off-Policy algorithms, on the other hand, use a memory replay buffer to store and reuse samples.
This way, data efficiency is improved, but often at a cost in stability and ease of use. @gu2017interpolated

==== Policy Gradient Method <policy_gradient>

Policy gradient methods are reinforcement learning approaches that directly optimise the policy.
They are centred around a parametrised policy $pi_theta$ with parameters $theta$
that allow the selection of actions $a$ given the state $s$.
The policy can either be deterministic $a = pi_theta (s)$ or stochastic $a ~ pi_theta (a|s)$.

The goal of the algorithm is to optimise the expected return
$ J(theta) = Z_gamma E{sum_"k=0"^H gamma^k r_k} \, $
where $gamma$ denotes a discount factor, $Z_gamma$ is a normalisation factor, $H$ is the horizon, and $r_k$ is the reward at time step $k$.

The policy gradient methods follow the gradient of the expected return
$ theta_"k+1" = theta_k + alpha_k nabla_theta J(pi_theta)|_(theta=theta_k) $

Policy gradient approaches have the advantages that they often have fewer parameters for representing the optimal policy than value-based methods,
and they are guaranteed to converge to at least a locally optimal policy. They can also handle continuous states and actions,
and often even imperfect state information. However, they are slow to converge in discrete problems,
global optima are not attained and they are difficult to use in off-policy settings. @peters2010policy

==== Q-Learning <q-learning>

An early off-policy reinforcement learning algorithm that uses the Bellman equation is Q-learning @watkins1992q.
It defines Q values (or action-values) for a policy $pi$:
$ Q^pi (x, a) = Re_x(a) + gamma  sum_y P_"xy" [pi(x)] V^pi (y) \, $
where $theta_k$ denotes the parameters after update $k$ with initial policy $theta_0$ and $alpha_k$ is the learning rate.

Meaning, the Q value is the expected discounted reward for executing action $a$ at state $x$ and following policy $pi$ thereafter.
Theoretically, by using the policy to always take the action with the highest Q value, the Q-learning agent is able to find the optimal policy.
In Q-learning, the agent has a set of acts that it repeats during so-called episodes:
in the nth episode, the agent:
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

#figure(
  table(
    columns: 5,
    [State], [Action1], [Action2], [...], [ActionN],
    [A], [0.5], [-0.2], [...], [0.8],
    [B], [0.9], [0.1], [...], [-0.3],
    [...], [...], [...], [...], [...],
    [Z], [0.2], [0.8], [...], [0.9],
  ),
  caption: [An example of a look-up table for Q values]
) <look-up>
To represent the Q values $Q_n (x, a)$, the algorithm uses a look-up table like shown in @look-up since other representations may not converge correctly. @watkins1992q

==== Deep Q-Network

An advancement of Q-learning is Deep Q-Network (DQN) @mnih2015human,
which combines Q-Learning with deep neural networks.
Instead of the look-up table representation, which becomes impractical for large state spaces due to high memory usage,
DQN uses a neural network to approximate the optimal Q values:
$ Q^*(s,a) = max_a EE[r_t + gamma r_"t+1" + gamma^2 r_"t+2" + ... |s_t = s, a_t = a, pi] "," $
which is the maximum sum of rewards $r_t$ discounted by $gamma$ at each time step $t$,
achievable by a behaviour policy $pi = P(a|s)$, after making an observation ($s$) and taking an action ($a$).

It stores samples of experience ($s_t$, $a_t$, $r_t$, $s_"t+1"$) in a replay buffer at each time-step $t$ in a data set $D_t = {e_1, ..., e_t}$.
The Q-learning updates are applied on samples of experience drawn uniformly at random from the replay buffer.

The loss function, a function that measures the difference between the predicted and the actual target values, 
to quantify how well or poor the model has performed and to update the parameters of the neural network, is defined as:

$ cal(L)(theta) = EE_((s,a,r,s')~cal(D))[(r + gamma max_a' Q_"target" (s', a'; theta_i^-) - Q(s, a; theta))^2] $

in which $gamma$ is the discount factor determining the agent's horizon, $theta_i$ are
the parameters -- or rather weights -- of the Q-network at iteration $i$ and $theta_i^-$ are the network
parameters used to compute the target at iteration $i$.
The target network's weights $theta_i^-$ held fixed between individual updates and are only
updated with the Q-network's parameters ($theta_i$) at fixed intervals. @mnih2015human

==== Deep Deterministic Policy Gradients

While DQN can solve problems high-dimensional observation spaces,
it can only handle discrete and low-dimensional action spaces.
To address these issues and to be able to solve continuous action spaces,
Deep Deterministic Policy Gradients (DDPG) @lillicrap2015continuous was introduced,
which combines the insights of DQN with the actor-critic approach.
The actor-critic approach itself combines the policy gradient methods of @policy_gradient as the actor
with the value-based methods of @q-learning as the critic, to take advantage of the strengths of both approaches.

Initially, DDPG randomly initialises the critic network $Q(s, a|theta^Q)$ and actor $mu(s|theta^mu)$ with
their corresponding weights $theta^Q$ and $theta^mu$. \
It then repeatedly goes through episodes, each of which consists of first
initialising a random process $N$ for action exploration, then observing the current state $s_t$,
followed by repeating the following steps a predetermined number of times:
+ Select action $a_t = mu(s_t|theta^mu) + N_t$ with $N_t$ being the exploration noise
+ Execute action $a_t$ and observe reward $r_t$ and new state $s_"t+1"$
+ Store experience ($s_t$, $a_t$, $r_t$, $s_"t+1"$) in replay buffer $R$
+ Sample a random minibatch of $N$ transitions ($s_i$, $a_i$, $r_i$, $s_"i+1"$) from $R$
+ Set $y_i = r_i + gamma Q'(s_(i+1), mu'(s_(i+1)|theta^mu')|theta^Q')$
+ Update critic by minimising the loss $L = 1/N sum_i (y_i - Q(s_i, a_i|theta^Q))^2$
+ Update the actor policy using the sampled policy gradient:
  $ nabla_(theta^mu) J approx 1/N sum_i nabla_a Q(s, a|theta^Q)|_(s=s_i, a=mu(s_i)) nabla_(theta^mu) mu(s|theta^mu)|_(s_i) $
+ Update the target networks:
  $ theta^Q' <- r theta^Q + (1 - tau)theta^Q' $
  $ theta^mu' <- r theta^mu + (1 - tau)theta^mu' $

This leads to DDPG finding solutions for Atari games in a factor of 20 fewer steps than DQN. @lillicrap2015continuous

==== TD3

While DDPG can sometimes achieve great performance, it is often brittle with respect to hyperparameters and other types of tuning. A common failure mode for DDPG is that the learnt Q-function starts to dramatically overestimate Q-values, which then leads to the policy breaking because it exploits the errors in the Q-function.
To address these issues, Twin Delayed Deep Deterministic Policy Gradient (TD3) @fujimoto2018addressing was introduced.
TD3 applies three modifications to DDPG to increase the stability and performance with consideration of the function approximation error:
+ Clipped Double Q-Learning: TD3 uses two Q-functions to mitigate the overestimation of Q-values. The minimum of the two Q-values is used to compute the target value,
  resulting in the target update being:
  $ y_1 = r + gamma min_(i=1,2)Q_theta_i^' (s', pi_phi.alt_1(s')) \, $
  with $Q_theta_i^' (s', pi_phi.alt_1(s'))$ being the Q-value of the target network $Q_theta_i^'$ for the next state $s'$ and the action $pi_phi.alt_1(s')$.

+ "Delayed" Policy Updates: The policy is updated less frequently than the Q-function, which prevents the policy from overfitting to the current Q-function. One policy update for every two Q-function updates is recommended.

+ Target Policy Smoothing: TD3 adds noise to the target action, to make it harder for the policy to exploit Q-function errors by smoothing out Q along changes in action:
  $ y = r + gamma Q_theta' (s', pi_phi.alt'(s') + epsilon.alt), epsilon.alt ~ "clip"(cal(N)(0, sigma), -c, c) \, $
  with $epsilon$ being the noise sampled from a clipped normal distribution.

These modifications lead to TD3 greatly improving both learning speed and performance of DDPG in a 
number of challenging tasks in the continuous control setting. @fujimoto2018addressing

==== SAC

Soft Actor Critic (SAC) is like DDPG and TD3 an off-policy actor-critic algorithm,
but instead of only trying to maximise the expected return, it also maximises the entropy of the policy.
That way, the algorithm strives to succeed at the task while acting as randomly as possible.

To factor in the entropy, it uses a maximum entropy objective which favours stochastic policies 
by adding the expected entropy of the policy over $rho_pi(s_t)$ to the objective:

$ J(pi) = sum_(t=0)^T EE_((s_t, a_t)~rho_pi)[r(s_t, a_t) + alpha cal(H)(pi(dot.c|s_t))] \, $

where $alpha$ is the temperature parameter that determines the relative importance of the entropy term $cal(H)$ against the reward and
controls the stochasticity of the optimal policy.
As the temperature approaches zero ($alpha -> 0$), the maximum entropy objective reduces to the conventional maximum expected return objective.

The objective has several advantages like being incentivised to explore more widely, while abandoning unpromising routes.
It can also capture multiple modes of near-optimal behaviour; in problem settings where multiple actions appear equally attractive, 
the policy will give equal probability mass to those actions. 
Lastly, it has been observed that it improves learning speed over other state-of-art algorithms, 
which use the conventional objective of maximising the expected sum of rewards, like DDPG and TD3.

#import "@preview/algo:0.3.6": algo, i, d, comment, code
#figure(
algo(
  header: [
    #set text(font: "Libertinus Serif", weight: "bold")
    #smallcaps("Soft Actor Critic")\ 
    #v(-1.5em) #repeat("_")
  ],
  main-text-styles: (size: 10pt),
  comment-styles: (size: 10pt),
  line-numbers: false,
  indent-size: 10pt,
  indent-guides: 1pt + gray,
  inset: 5pt,
  column-gutter: 10pt
)[
  *Input:* $theta_1, theta_2, phi.alt$ #comment("Initial parameters")\
  $theta_1 <- theta_1, theta_2 <- theta_2$ #comment("Initialise target network weights")\
  $cal(D) <- nothing$ #comment("Initialise an empty replay pool")\
  for each interation do#i\
    for each environment step do#i\
      $a_t ~ pi_phi.alt (a_t|s_t)$. #comment("Sample action from the policy")\
      $s_(t+1) ~ p(s_(t+1)|s_t, a_t)$ #comment("Sample transition from the environment")\
      $cal(D) <- cal(D) union {(s_t), a_t, r(s_t, a_t), s_(t+1)} $ #comment("Store the transition in the replay pool")#d\
    end for\
    for each gradient step do#i\
      $theta_i <- theta_i - lambda_Q accent(nabla, hat)_theta_i J_Q (theta_i) "for" i in {1,2}$ #comment("Update Q-function parameters")\
      $phi.alt <- phi.alt - lambda_pi accent(nabla, hat)_phi.alt J_pi (phi.alt)$ #comment("Update policy parameters")\
      $alpha <- alpha - delta accent(nabla, hat)_alpha J(alpha)$ #comment("Adjust temperature")\
      $theta_1 <- tau theta_1 + (1 - tau) theta_1$ #comment("Update target network weights")#d\
    end for#d\
  end for\
  *Output:* $theta_1, theta_2, phi.alt$ #comment("Optimised parameters")
],
caption: [Pseudocode of the Soft Actor Critic algorithm]
) <SAC>

SAC uses a parametrised soft Q-function $Q_theta (s_t, a_t)$ and a tractable policy $pi_phi.alt (a_t|s_t)$, whose
parameters are $theta$ and $phi.alt$, respectively.
The Q-function can be modelled as a neural network and trained to minimise the Bellman residual,
which is the difference between the left and right side of the Bellman equation,
thus quantifying how well the Q-function satisfies the Bellman equation:
$ J_Q (theta) = EE_((s_t, a_t) ~ D) [1/2(Q_theta (s_t, a_t) - (r(s_t, a_t) + gamma EE_(s_(t+1)~p) [V_accent(theta, macron) (s_(t+1))]))^2] \, $
where the value function is implicitly parametrised through the soft Q-function parameters via
$V(s_t) = EE_(a_t~pi) [Q(s_t, a_t) - alpha log pi(a_t|s_t)]$, and it can be optimised with stochastic gradients:
$ accent(nabla,hat)_theta J_Q (theta) = nabla_theta Q_theta (a_t, s_t) (Q_theta (s_t, a_t) - (r(s_t, a_t) + gamma (Q_(accent(theta, macron)) (s_(t+1) , a_(t+1)) - alpha log (pi_phi.alt (a_(t+1)|s_(t+1))))) . $ <stochastic_gradient>

The update uses a target soft Q-function with parameters $accent(theta, macron)$ obtained as an exponential moving average of soft Q-function weights, which has been shown to stabilise training.

//$ pi_"new" = arg min_(pi' in Pi) D_"KL" (pi'(dot.c|s_t) || (exp(1/alpha Q^(pi_"old") (s_t, dot.c)) / (Z^(pi_"old") (s_t)))) \, $
//$ J_pi(phi.alt) = EE_(s_t~D) [D_("KL")(pi_phi.alt (dot.c|s_t) || (exp(Q_theta (s_t, dot.c))/(Z_theta (s_t)))] $

The policy parameters, however, are learnt by directly minimising the expected Kullback-Leibler divergence
$ J_pi (phi.alt) = EE_(s_t~D) [ EE_(a_t~pi_phi.alt) [alpha log (pi_phi.alt (a_t|s_t)) - Q_theta (s_t, s_t)]] . $
By reparameterising the policy using a neural network transformation \ $a_t = f_phi.alt (epsilon.alt_t: s_t)$, 
where $epsilon.alt$ is an input noise vector, sampled from some fixed distribution the actor's function is now:
$ J_pi (phi.alt) = EE_(s_t~D, epsilon.alt_t ~ cal(N))[alpha log pi_phi.alt (f_phi.alt (epsilon.alt; s_t)|s_t) - Q_theta (s_t, f_theta (epsilon.alt_t;s_t))] \, $
where $pi_phi.alt$ is defined implicitly in terms of $f_phi.alt$.
The gradient of the equation can be approximated:

$ accent(nabla, hat)_phi.alt J_pi (phi.alt) = nabla_phi.alt alpha log (pi_phi.alt(a_t|s_t)) + (nabla_a_t alpha log (pi_phi.alt(a_t|s_t)) - nabla_a_t Q(s_t, a_t)) nabla_phi.alt f_phi.alt (epsilon.alt_t \; s_t) \, $ <sac_policy_gradient>
where $a_t$ is evaluated at $f_phi.alt (epsilon.alt_t; s_t)$.

Like TD3, SAC uses two Q-function with parameters $theta_i$, train them indepenently to optimise $J_Q (theta_i)$
and use the minimum of both for the #link(<stochastic_gradient>)[stochastic gradient] and #link(<sac_policy_gradient>)[policy gradient].

The gradient for the temperature $alpha$ are computed with the objective:
$ J(alpha) = EE_a_(t~pi_t) [-alpha log pi_t (a_t|s_t) - alpha accent(cal(H), macron)] $

SAC has been shown to be robust and sample efficient enough to perform in real-world robotic tasks like underactuated walking of a quadrupedal robot and
even outperforms other state-of-art algorithms such as TD3 on several continuous control benchmarks.
@haarnoja2018soft @haarnoja2018soft2

// #pagebreak()
// The soft value function (the actor) is trained to minimise the squared residual error
// $ J_V(psi) = EE_((s_t~cal(D))) [1/2 ( V_Psi (s_t) - EE_(a_t~pi_phi.alt) [Q_theta (s_t, a_t) - log pi_phi.alt (a_t|s_t)])^2 ] \, $<eq>
// where $cal(D)$ is the distribution of the replay buffer.
// The gradients of the #link(<eq>)[previous equation] can be estimated with an unbiased estimator

// $ nabla_(psi) J_V (psi) = nabla_(psi) V_(psi) (s_t) (V_(psi) (s_t) - Q_(theta) (s_t, a_t) + log pi_(phi.alt)(a_t|s_t)) \, $
// where the actions are sampled from the policy and not from the replay buffer.
// The soft Q-function is trained to minimise the Bellman residual, 
// which is the difference between the left and right side of the Bellman equation,
// thus quantifying how well the Q-function satisfies the Bellman equation:
// $ J_Q(theta) = EE_((s_t, a_t)~cal(D)) [1/2 (Q_theta (s_t, a_t) - accent(Q, hat)(s_t, a_t))^2] \, $
// with
// $ accent(Q, hat)(s_t, a_t) = r(s_t, a_t) + gamma EE_(s_(t+1)~p)[V_(accent(Psi, macron))(s_t+1)] \, $
// which can be optimised with stochastic gradients
// $  accent(nabla, hat)_(theta) J_Q (theta) =  nabla_( theta) Q_( theta) (a_t, s_t) (Q_( theta) (s_t, a_t) - r(s_t, a_t) -  gamma V_(accent(psi, macron)) (s_(t+1))) \. $

// The update utilises a target value network $V_(accent(psi, macron))$, where $accent(psi, macron)$
// is an exponentially moving average of the value network weights.

// Finally, the parameters of the policy are learned by minimising the expected Kullback-Leibler divergence:
// $ J_pi(phi.alt) = EE_(s_t~D) [D_("KL")(pi_phi.alt (dot.c|s_t) || (exp(Q_theta (s_t, dot.c))/(Z_theta (s_t)))] $