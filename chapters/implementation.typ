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
Both classes are heavily based on the network implementation of SAC in harl #footnote[https://gitlab.com/arl2/harl/-/blob/development/src/harl/sac/network.py?ref_type=heads]. 
The only change made to the original implementation is the net itself; it was made changeable to allow the NAS methods to change the network's architecture.

== NEAT

The implementation of NEAT is PyTorch-NEAT, a GitHub repository by ddehueck #footnote[https://github.com/ddehueck/pytorch-neat/].
Minor additions were conducted to make the implementation compatible with this use case:
A list of rewards and a method to add a reward to it was given to the genomes.
Further, the fitness function of NEAT was changed to base the genome's fitness on its reward list; the standard fitness is the mean of the rewards, but other functions like the sum or the maximum are also selectable by the user.
These changes are necessary, since the use case makes it impossible to calculate the fitness of the genome directly and without prior runs.

The for this implementation of NEAT necessary config file was created based on the repository's example config file.
This config file contains the parameters of the genomes, populations, and the NEAT algorithm itself.
All these parameters are adjusted to the user specified values. The aforementioned adapted fitness function is also set in this config file.

== RL

The reinforcement learning based NAS method is based on the 'minimal-nas' implementation by nicklashansen #footnote[https://github.com/nicklashansen/minimal-nas].
A controller class contains the reinforcement learning algorithm; each time a new network is to be run, 
the controller is called to optimise its algorithm's network and generate a rollout.
The 'run'-method of the NAS receives a loss value in addition to the reward.
This loss value is used in optimising the controller's network, whilst the reward is used to determine the network's performance, in order to be able to select the best performing network.
The rollout consists of a list of actions, which can be either a number of features in a layer, an activation function, or a stop.
A net is generated with these actions by first adding an input layer, then iterating over the actions and adding the corresponding layer or stopping respectively and finally adding an output layer.

== BO

The Bayesian Optimisation NAS method is based on the python 'bayesian-optimization' implementation #footnote[https://github.com/bayesian-optimization/BayesianOptimization].
For BO, a function to optimise -- the black box function -- is needed.
In order to let BO generate a usable network, it has to be encoded in a way that it can be used as suck a black box function.
In this use case, the network is encoded as six parameters each reaching from 0 to 256, depicting the number of features in the corresponding layer.
A 0 means that the layer is skipped. 
The reward of each network is used to tell BO how well the network performed, which in turn uses the info to step the search in the right direction and propose a net set of parameters for the black box function and network respectively.
