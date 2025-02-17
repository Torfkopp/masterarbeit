= Implementation

For the implementation, each of the NAS methods is implemented in a separate Python class.
The Python classes contain an initialisation or setup method, a method to return the initial network, as well as a 'run'-method.

The former is used to setup the NAS algorithm and receives a dictionary of parameters.
Due to wanting all important parameters to be adaptable by the user, this dictionary is 
taken from the .yaml-file, which is used in palaestrAI to configure an experiment.
If the user does not provide a parameter, the standard values are used.

Secondly, the method to return the initial network is used to get a network for the setup of the SAC actor in the brain.
This is put into a method to provide a similar usage of each NAS method.

Finally, the 'run'-method is used to run the NAS algorithm. It gets called in every turn of the brain.
The method receives the last reward and saves it in a way that allows to get the reward of the network using its network-describing properties.
To ensure the network's reward corresponds the network's properties, each network is run for several steps.
This way, a network that would perform poorly in the long run will not get a high reward due to a lucky natural fluctuation of the powergrid or vice versa.
The 'run'-method returns a network, if a new one shall be run, and whether the NAS algorithm has finished, 
in which case the brain will stop calling the NAS and proceed with the SAC algorithm's learning.

Each of the NAS-methods also has a file describing the network. 
These contain a class for the NAS actor as well as a class for this actor's network.
Both classes are heavily based on the network implementation of SAC in harl #footnote[https://gitlab.com/arl2/harl]. 
The only change made to the original implementation is the net itself; it was made changeable to allow the NAS methods to change the network's architecture.

== NEAT

For the implementation of NEAT a GitHub repository by ddehueck called PyTorch-NEAT #footnote[https://github.com/ddehueck/pytorch-neat/] was used.
Minor additions were conducted to make the implementation compatible with this use case:
A list of rewards and a method to add a reward to it was given to the genomes.
Further, the fitness function of NEAT was changed to base the genome's fitness on its reward list; the standard fitness is the mean of the rewards, but other functions like the sum or the maximum are also selectable by the user.
These changes are necessary, since the use case makes it impossible to calculate the fitness of the genome directly and without prior runs.

The for this implementation of NEAT necessary config file was created based on the repository's example config file.
This config file contains the parameters of the genomes, populations, and the NEAT algorithm itself.
All these parameters are adjusted to the user specified values. The aforementioned adapted fitness function is also set in this config file.

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
This network is run several times -- every run generating a reward that is saved with its corresponding network and can be used to select the best performing network afterwards --, and after all runs, a loss value is calculated with the network's runs.
The loss value is adjusted to be added to the aforementioned reward afterwards: the nearer the loss is to 0, the higher the reward, with 2 being the highest reward.
Finally, the NAS's reinforcement learning algorithm is optimised by utilising this reward.

== BO

The Bayesian Optimisation NAS method is based on the python 'bayesian-optimization' implementation #footnote[https://github.com/bayesian-optimization/BayesianOptimization].
For BO, a function to optimise -- the black box function -- is needed.
In order to let BO generate a usable network, it has to be encoded in a way that can be used as such a black box function.
In this use case, the network is encoded as six parameters each reaching from 0 to 256, depicting the number of features in the corresponding layer.
A 0 means that the layer is skipped. 
The rewards of each network accumulated during their runs are used to tell BO how well the network performed, which in turn uses the info to step the search in the right direction and propose a new set of parameters for the black box function and network respectively.
