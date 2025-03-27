#import "/images/diagrams.typ": concept, neatnas, rlnas, bonas

= Concept
In order to establish a neural architecture search (NAS) into the reinforcement learning
agents of palaestrAI, breaking up the learning cycle is needed.
Due to the nature of reinforcement learning, namely using the result of the agent's actions
in an environment to calculate a reward, which is then used for improvement,
it is not possible to execute a NAS before starting the whole process of palaestrAI, 
making it necessary to run the NAS in parallel.

#figure(
  scale(70%, reflow: true)[#concept],
  caption: [Adding NAS to the palaestrAI cycle],
) <Concept>

On the left side of @Concept, a simplified version of @palaestrai_schema with focus on the agent is shown.
The agent's muscle suggests actions to take to the environment, 
which in result returns a reward to the agent's brain.
In the brain the learning process takes places which changes the agent's network.
Based on this network, the actions to suggest are calculated.

To add NAS to this cycle, the learning method of the brain is either completely or at times replaced by the NAS.
After getting set up and creating an initial network, NAS generates a new network in every of its turns,
which is then given to the brain to replace its current network.
After the search finishes, the NAS is turned off and the normal learning behaviour is resumed.

Three different approaches of NAS were integrated as shown above:
+ An evolutionary algorithm in the form of NEAT
+ Reinforcement learning based NAS
+ Bayesian Optimisation

#figure(
  scale(70%, reflow: true)[#neatnas],
  caption: [Using NEAT as NAS],
) <NEAT_app>

@NEAT_app shows the cycle with NEAT as the NAS method.
During the setup, the first population of NEAT is generated.
The network to be used is then taken from this population and run through the cycle.
The resulting reward is forwarded by the brain to NEAT and saved to be used for the network's evaluation.
If every network of the population has been evaluated, NEAT uses their resulting rewards to select the best ones and generate a new population.
This process is repeated until the search is finished, ideally by finding a network that performs well in the environment.
Due to the nature of NEAT, the network's weights are also improved throughout generations,
making the original learning process obsolete. 
However, after NEAT has finished, further improvement with the normal learning process is still possible.

#figure(
  scale(70%, reflow: true)[#rlnas],
  caption: [Using a RL approach as NAS],
) <RL_app>

In @RL_app, the cycle is shown with reinforcement learning based NAS.
Here, the NAS uses its reinforcement learning algorithm to generate a list of actions.
These actions are used to create the initial network, which is then run through the cycle.
During the runs, the network is trained normally in the brain where its weights are improved until a specified amount of runs is reached.
Afterwards, the brain forwards the result as well as a loss to the NAS method, which are
used to improve the NAS's reinforcement learning algorithm and generate a new network.
By repeating the cycle, the algorithm should be able to improve the yielded results of its generated in the environment.
After repeating the generation and running cycle a certain amount of times, the search is finished and
the latest and/or best performing network is used for the normal learning process.

#figure(
  scale(70%, reflow: true)[#bonas],
  caption: [Using BO as NAS],
) <Bayesian_app>

Lastly, @Bayesian_app shows the cycle with Bayesian optimisation as the NAS method.
The black box function used for the Bayesian optimisation is made of an encoding of the network's topology.
The result of the network's run is given to the algorithm to improve and select the next batch of parameters.
By iterating through this process, the algorithm should be able to find a network with a high reward.
Same as with the reinforcement learning approach above, 
each network is run through the normal learning process to improve the weights during its turn.
