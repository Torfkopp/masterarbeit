= Evaluation and Further work

The two experiments show contrary results:
Whilst the first experiment shows a clear advantage of the Bayesian optimisation method
with a performance of the reinforcement learning approach and NEAT being similar to that of the baseline,
the second experiment shows a clear loss of all the NAS methods compared to the baseline.

In neither the first nor the second experiment the NAS methods seem to be learning, 
as the rewards are not increasing over time.
During the first experiment, the baseline is not learning either, which may be
the reason for the NAS methods' performance being similar to the baseline's.
Since the baseline is learning in the second experiment, it can be taken into consideration
that the first experiment was not working as intended.

Thus the results of the second experiment may be more reliable than the first experiment's results.
As both the RL method and the BO method should be using SAC's normal learning process
-- which is working as intended as seen in the baseline's case --
after the NAS methods have finished at around two thirds of the phase time,
the results of the second experiment are a clear indicator that parts of the NAS methods might not be working as intended.

Even though the software stack around palaestrAI went through some changes during the time of the experiments,
it stands to reason that the implementation of the NAS methods into the harl framework may have some underlying problems
and unintended behaviour.
The possibility of the NAS methods simply not being able to handle the task at hand (in the time given) should also be taken into consideration.
Further investigation and experimentation is needed to clarify the reasons for the NAS methods' performance.

The reason for the lower overall reward for NEAT in the second experiment is known;
it is due to the reduced number of actuators over which the agent has control.
This was done to circumvent a problem occurring when using the NEAT agent with all actuators:
starting the experiment leads to palaestrAI finishing the simulation right after the first step,
whilst the same experiment with other or no NAS methods run the whole distance as expected.
This problem and its origins are still under investigation, but is presumed to be due to the network structure of the NEAT implementation used.
Pytorch-NEAT uses a unique feed forward network structure, which, since the implementation uses torch as library, 
could be implemented into the harl framework.
However, this network structure is not the same as the network structure used in the SAC implementation of harl
and thus it is not possible to continue with a normal training process after NEAT has finished.
If further work on the NEAT implementation is deemed to be worth the while,
a possible starting point could be the change to a network structure similar to the one used in harl's SAC implementation.
Besides the possible erasure of this and similar problems and the possibility of a subsequent training of the network,
this also increases the reusability of the network.
Despite the advantages, this adaption is a non-trivial task and possibly requires a lot of work,
because one has to make sure the conversion of NEAT's genomes functions as intended and like the current unique network structure.

The Bayesian optimisation approach to the NAS has big room for improvement, as well.
Currently, the devised black box function is rather simple by having six parameters,
which represent the amount of features in the layer, and can assume values between 0, in which case no layer is employed, and 256.
This leads to a network with six layers each having 128 features on average, which is a rather big network.
The big network could be the reason for the poor performance of the BO method in the second experiment.
Large networks tend to have longer learning times and take a long time to learn the characteristics of the data @kavzoglu1999determining.
The baseline, however, uses a two layer network with 48 features each.
A reduction of the parameters to tune for the Bayesian optimisation (e.g. two parameters to match the baseline's network size),
may speed up the method and lead to a network with visible learning process.

Other opportunities for enhancement of the NAS methods' performances is the optimisation of the parameters.
At the moment, the parameters are mostly set to the default values of the implementations.
Consultation of literature or usage of common practices like computational methods to optimise 
the parameters for the specific task could lead to a better performance of the NAS methods,
which is like the premise of this thesis, just one level further.

At the moment, the parameters to determine the duration of the NAS methods are either set
by the user or left to default.
For the experiments these values were set manually so that the methods end before the experiment finishes.
This adaption to the experiment's length could also be automated,
reducing the amount of setting leaving the user to only activate the NAS method.

Lastly, the implementation of other algorithms could also bring improvements.
The implementations in this work have lead to an existing foundation to build upon, 
by having examples of three different NAS methods already connected to the harl framework.
Thus, a good chunk of the implementation work is already done and a new
NAS method with possibly greater performance could be implemented with less effort.
