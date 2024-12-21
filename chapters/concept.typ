= Concept
BILDER ÜBERARBEITEN

In order to establish a neural architecture search (NAS) into the reinforcement learning
agents of palaestrAI, breaking up the learning cycle is needed.
Due to the nature of reinforcement learning, namely using the result of the agent's actions
in an environment to calculate a reward, which is then used for improvement,
it is not possible to execute a NAS before starting the whole process of palaestrAI, 
making it necessary to run the NAS in parallel.

#figure(
  image("/images/_concept1.png", width: 00%),
  caption: [Adding NAS to the palaestrAI cycle],
) <Concept>

On the left side of @Concept, the basic cycle of palaestrAI is shown.
The agent's muscle suggests actions to take to the environment, 
which in result returns a reward to the agent's brain.
In the brain the learning process takes places which changes the agent's network.
Based on this network, the actions to suggest are calculated.

To add NAS to this cycle, the learning method of the brain is replaced by NAS for the duration of the search.
After getting set up and creating an initial network, NAS generates a new network in every of its turns,
which is then given to the brain to replace its current network.
After the search is finished, the original learning method replaces NAS to resume normal learning behaviour.

Three different approaches of NAS were integrated as shown above:
+ An evolutionary algorithm in the form of NEAT
+ Reinforcement learning based NAS
+ Bayesian Optimisation

#figure(
  image("/images/_NEAT.png", width: 00%),
  caption: [],
) <NEAT_app>

@NEAT_app shows the cycle with NEAT as the NAS method.
During the setup, the first population of NEAT is generated.
The network to be used is then taken from this population and run through the cycle.
The resulting reward is forwarded by the brain to NEAT and saved to be used for the network's evaluation.
If every network of the population has been evaluated, NEAT uses their resulting rewards to select the best ones and generate a new population.
This process is repeated until the search is finished, ideally by finding a network that performs well in the environment.
Due to the nature of NEAT, the network's weights are also improved throughout generations, 
but further improvement with the normal learning process is still possible.

#figure(
  image("/images/_RLNAS.png", width: 00%),
  caption: [],
) <RL_app>

In @RL_app, the cycle is shown with reinforcement learning based NAS.
Here, the NAS uses its reinforcement learning algorithm to generate a list of actions.
These actions are used to create a network, which is then run through the cycle.
The brain forwards the result as well as a loss to the NAS method, which are
used to improve the NAS's reinforcement learning algorithm.
By repeating the cycle, the algorithm should be able to generate networks yielding better results in the environment.
The search finishes after a set amount of steps; 
afterwards the latest -- and ideally best -- network is run through the normal learning process, where its weights are improved.

#figure(
  image("/images/_BONAS.png", width: 00%),
  caption: [],
) <Bayesian_app>

Lastly, @Bayesian_app shows the cycle with Bayesian Optimisation as the NAS method.
The black box function used for the Bayesian optimisation is made of an encoding of the network's topology.
The result of the network's run is given to the algorithm to improve and select the next batch of parameters.
By iterating through this process, the algorithm should be able to find a network with a high reward.
Same as with the reinforcement learning approach above, 
the network is run through the normal learning process after the search is finished to improve the weights.

