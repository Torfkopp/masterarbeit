= Implementation <implementation>
For the implementation, each of the NAS methods is implemented in a separate Python module.
Each module contains a class for the NAS method, which is used to link the brain to the NAS algorithm.
This class is getting instantiated in the brain and is used to run the NAS algorithm.
By setting a flag in the palaestrAI experiment file, the method of NAS can be selected.

Each of the NAS-methods also has their own network implementation.
These contain a class for the NAS actor as well as a class for this actor's network.
Both classes are almost identical to the network implementation of SAC in harl #footnote[https://gitlab.com/arl2/harl/-/blob/development/src/harl/sac/network.py?ref_type=heads]. 
The only change made to the original implementation is the net itself; it was made changeable to allow the NAS methods to change the network's architecture.

The classes contain an initialisation or setup method, a method to return the initial network, as well as a 'run'-method.
The former is used to setup the NAS algorithm and receives a dictionary of parameters.
By taking a dictionary from the experiment file, the parameters of the NAS Method can be freely chosen by the user;
standard values are used if the user does not provide a parameter.

The method to return the initial network is used during the setup process of the brain.
When SAC's actor network is set up, this method is called to get the first network of the NAS algorithm.

Finally, the 'run'-method is used where the neural architecture search takes place.
In every step inside the brain -- as long as the nas is not finished yet --, a `nas_update` method is called.
This method calls the corresponding NAS method's 'run'-method at the right times (depending on the NAS method) with the specific preparations needed.
The 'run'-methods return a new network (or parameters to create a network) and whether the NAS algorithm has finished.
Every new network is put into the SAC actor and an update containing the changed actor is sent to the muscle.
If the NAS algorithm has finished, the brain will stop calling the NAS and proceed with the SAC algorithm's learning.

== NEAT

For the implementation of NEAT a GitHub repository by ddehueck called PyTorch-NEAT #footnote[https://github.com/ddehueck/pytorch-neat/] was used.
Minor additions were conducted to make the implementation compatible with this use case:
A list of rewards and a method to add a reward to it was given to the genomes.
Further, the fitness function of NEAT was changed to base the genome's fitness on its reward list; the standard fitness is the mean of the rewards, but other functions like the sum or the maximum are also selectable by the user.
These changes are necessary, since the use case makes it impossible to calculate the fitness of the genome directly and without prior runs.

The for this implementation of NEAT necessary config file was created based on the repository's example config file.
This config file contains the parameters of the genomes, populations, and the NEAT algorithm itself.
All these parameters are adjusted to the user specified values. The aforementioned adapted fitness function is also set in this config file.

In every step of the brain, the NEAT run method is called with the last step's reward.
This reward is added to the current genome's reward list.
If the genome and thus its corresponding network was run enough times through the process, 
the next genome of the population is popped and their network is returned to the brain.
When the population has no more unrun genomes, a new population is created.
This is repeated until a genome is found with a fitness over the user specified threshold
or the maximum number of generations is exceeded.
Both cases lead to NEAT finishing and the brain proceeding with the SAC algorithm.

== RL

The NAS method using reinforcement learning is based on the 'minimal-nas' implementation by nicklashansen #footnote[https://github.com/nicklashansen/minimal-nas].
A controller class contains the reinforcement learning algorithm, which itself uses a simple neural network with a single hidden layer.
In order to get the network to be optimised, the controller generates a rollout.
During the rollout, several steps are taken; in each step, the network returns an integer representing the next action:
The action is used to determine the next layer of the network and is either a number of features in a layer, an activation function, or a stop.
Steps are taken by the algorithm until either a maximum depth is reached, or a stop is returned.
To penalise the creation of certain networks, a reward is adapted. This way, an early stop (leading to a network without hidden layers) is heavily penalised (-1) and having two layers of the same kind (two feature layer or two activation layers) directly after each other is mildly penalised (-0.1).
After terminating the rollout, the list of actions is used to generate the new network.
This is done by first adding an input layer with use case specific in features, then iterating over the actions and adding the corresponding layer or stopping respectively, and finally adding an output layer.

Each network is run several times:
The `nas_update`-method mentioned before calls the RL NAS's run method to create a new network every time 
the step counter is a multiple of the amount of `runs_per_network` times the SAC implementation's `update_every` parameter.
Every time the step counter is only a multiple of the `update_every` parameter, the network is trained with the normal SAC algorithm's training method.
This way, the network gets trained `runs_per_network`-times before the run-method is called with a loss value calculated from the network's runs.
The loss value is adapted into a reward value that is higher the nearer the loss is to 0, with 2 being the highest value;
it is then added to the controller's internal reward of the network and used to optimise the reinforcement learning algorithm.
The external reward coming from the environment is getting saved in a dictionary which maps the network to the reward and
is used to select the best performing network to be used in the SAC algorithm after the NAS finishes.

The RL NAS finishes when a set number of networks were created and run through the whole process.

== BO

The Bayesian optimisation NAS method is based on the python 'bayesian-optimization' implementation #footnote[https://github.com/bayesian-optimization/BayesianOptimization].
For BO, a function to optimise -- the black box function -- is needed.
In order to let BO generate a usable network, it has to be encoded in a way that can be used as such a black box function.
In this use case, the network is encoded as six parameters each reaching from 0 to 256, depicting the number of features in the corresponding layer;
a 0 means that the layer is skipped. 
The rewards of each network accumulated during their runs are used to tell BO how well the network performed, which in turn uses the info to step the search in the right direction and propose a new set of parameters for the black box function and network respectively.

Like the RL NAS, the BO NAS's network is trained every `update_every` steps with the SAC algorithm
and exchanged when the network was trained `runs_per_network` times.
Besides the black box function, the BO NAS has two more settable parameters: `init_points` and `n_iter`.
The former is the number of random points to probe by BO before starting the optimisation.
The latter is the number of total iterations to run the optimisation, leading to BO NAS finishing as the number is reached.