= Further work

The results of the experiments show (good/bad/meh) ...
(Despite that/Thus) there are several opportunities to improve upon the NAS methods ...

One of those potential improvements is NEAT's network;
the implementation of the NEAT algorithm uses a unique feed forward network created after NEAT's genomes.
Because it is based on torch, it is possible to use it in the harl framework.
However, due to the difference in structure compared to the network used in harl's normal SAC implementation,
it is not possible to continue with a normal training process after NEAT has finished.
This network difference is also presumed to be the reason for a (at the moment of writing)
unidentifiable and untraceable problem with the "CIGRE + COHDARL"-experiment:
an experiment run started finishes right after the first step, 
whilst the same experiment with other NAS methods run the whole distance as expected.
This problem is still under investigation, but was circumvented by reducing the amount of actuators the agent has control over.
If further work on the NEAT implementation is deemed to be worth the while,
a possible starting point could be the change to a network structure similar to the one used in harl's SAC implementation.
Besides the possible erasure of this and similar problems and the possibility of a subsequent training of the network,
this also increases the reusability of the network.
Despite the advantages, this adaption is a non-trivial task and possibly requires a lot of work,
because one has to make sure the conversion of NEAT's genomes functions as intended and like the current unique network structure.

The bayesian optimisation approach to the NAS has a big room for improvement, as well.
Currently, the devised black box function is rather simple by having six parameters,
which represent the amount of features in the layer, and can assume values between 0, in which case no layer is employed, and 256.
This leads to a network with six layers each having 128 features on average, which is a rather big network.
By changing the black box function to a more complex one and/or one that is more tuned to the problem at hand,
the performance of this NAS method is believed to be greatly improved upon.

Other opportunities for enhancement of the NAS methods' performances is the optimisation of the parameters.
At the moment, the parameters are mostly set to the default values of the implementations or set to values which are assumed to be good.
Consultation of literature or usage of common practices like computational methods could lead to a better performance of the NAS methods.

Lastly, the implementation of other algorithms could also bring improvements.
The implementations in this work have lead to an existing foundation to build upon, 
by having examples of three different NAS methods already connected to the harl framework.
Thus, a good chunk of the implementation work is already done and a new
NAS method with possibly greater performance could be implemented with less effort.
