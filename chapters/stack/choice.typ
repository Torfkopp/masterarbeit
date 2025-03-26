== Choice of the algorithms

#import "/images/tables.typ": algorithms
#figure(
scale(70%, reflow: true)[#algorithms],
caption: [Comparison of possible algorithms on the availability of an useable implementation and their use.]
) <compare>

Many evolutionary algorithms that were found i.i. in surveys like @bai2023evolutionary @parker2022automated @Sigaud and other NAS algorithms
were assessed for the implementation.
These algorithms are listed in @compare.
Of these algorithms, many had either no available implementation, only pseudocode, or an implementation in a different programming language.
Since palaestrAI is written in python, the implementation had to be in python as well for compatibility and implementation reasons.

The goal of this thesis is to optimise the architecture of the reinforcement learning algorithm.
Hence, NEAT that has several popular python implementations like neat-python #footnote("https://github.com/CodeReclaimers/neat-python") or pytorch-neat #footnote("https://github.com/ddehueck/pytorch-neat") available was readily chosen -- latter was used as the implementation, because palaestrAI's SAC uses pytorch as well.
It was picked over its successor HyperNEAT, which improves upon NEAT by using the geometric regularities of the task domain: 
Even though HyperNEAT performs better for simple fractured problems, it has no improvement for more complicated problems and was slow even on multi-core processors @lowell2011comparison.

The implementation of the AutoDL-Project and NASLib algorithms as well as ProxylessNAS and Smash were tried.
Problems arose as these implementations are generally intended for the use in image classification -- NASLib additionally offers implementations for vision, speech recognition, and language processing tasks -- and the used neural nets for this kind of task are not compatible with the
use case faced in this thesis.
An adaption to the kind of net useable by the rest of the stack revealed itself to be highly complicated due
to the complexity of the implementations; changing the functionality of the net had implications for many parts of the implementation
and could not be done without influencing the functionality of the algorithm.

Despite originally being for image classification as well,
the minimal RL implementation could be adapted due to its simplicity.

Finally, Bayesian optimisation was chosen over the other hyperparameter optimisation algorithms,
due to "Bayesian Optimisation" being a household name in the field for many years now
and having a very popular maintained implementation #footnote("https://github.com/bayesian-optimization/BayesianOptimization") that is simple to integrate available.

Thus, three algorithms with different approaches to optimisation were chosen:
an evolutionary algorithm, a reinforcement learning algorithm, and a sequential design strategy.

The evolutionary algorithm NEAT tries to find the best topology and weights for the neural network.
The other two algorithm try to find the best architecture for the network without regards to the weights;
the reinforcement learning algorithm by trying to find the best set of parameters that represent the architecture,
and the Bayesian optimisation algorithm by optimising the black-box function describing the net's topology.
