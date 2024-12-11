NeuroEvolution of Augmenting Topologies (NEAT) is a genetic algorithm for the generation of artificial neural networks. It was developed by Kenneth O. Stanley and Risto Miikkulainen in 2001. 
NEAT not only evolves the topology of an artificial neural network, but also its weights and differs from other Darwinian evolutionary algorithms in three implementation aspects:

Firstly, starting with a minimal structure, NEAT gradually increases the the complexity of the networks over generations. This is based on the idea that it is easier to evolve a simple network to solve a problem and then add complexity to it, rather than starting with a complex network. \
Secondly, NEAT has a direct encoding of the network structure, which allows for the evolution of complex networks without the need for a pre-defined structure and crossovers between different network topologies. \
Lastly, NEAT protects structural innovations through speciation, which allows new topologies to optimise before competing with the general population. 

These key aspects of NEAT lead to it outperforming fixed-topology methods and other topology-evolving systems on challenging reinforcement learning tasks. @NEAT
