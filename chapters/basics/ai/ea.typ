== Neuroevolution

Neuroevolution is subfield within artificial intelligence and machine learning that consists
of trying to trigger an evolutionary process to evolve neural networks.
It uses evolutionary algorithms (EAs) to generate artificial neural networks, parameters, and rules.

The first neuroevolution algorithms appeared in the 1980s.
Researchers had to decide on the neural architecture themselves,
and the evolution of the weights was done by evolution instead of stochastic gradient descent (@stochastic_gradient_descent).

Evolutionary algorithms generally start with creating a population of iid individuals,
like neural networks with random weights.
Each of the individuals is evaluated by using it on the task at hand.
Based on the quality of its performance, the individual is given a "fitness" score.
The fittest individuals are selected to reproduce; 
the offspring is constructed by slightly altering the parents.
The best performing individuals amongst the offsprings are selected as parents as well, and so forth.
By repeating this process, each generation should have individuals better adapted to the task than the previous one. @oreillyNeuroevolutionDifferent

Later, the fixture of the topology was not needed anymore and TWEANN (Topology and Weight Evolving Artificial Neural Networks) algorithms were developed.
These algorithms could change the topology of the neural network as well, i.e. by adding a connection during the creation of an offspring.
The addition of the topolgy made the evolutionary algorithms more flexible and powerful.

#figure(
  image("/images/gadiagram.svg"),
  caption: [A diagram showing the general steps of a evolutionary algorithms #footnote("https://www.strong.io/blog/evolutionary-optimization")]
)

Evolutionary algorithms may be classified into three subcategories, each inspired by different evolutionary theories.
#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Darwinian Evolution]
Darwinian Evolution algorithms are rooted in Charles Darwin's theory of natural selection. These algorithms emphasise survival of the fittest, where individuals are selected based on their fitness, and crossover and mutation create variation. Genetic algorithms (GAs) are a primary example of this approach.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Lamarckian Evolution]
Lamarckian Evolution algorithms are based on Jean-Baptiste Lamarck's theory, which posits that traits acquired during an individual's lifetime can be passed to offspring. In EAs, this translates to individuals that can adapt and improve within their lifetime before passing on their enhanced traits, merging the ideas of learning and evolution.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Swarm Intelligence]
Swarm Intelligence algorithms are inspired by the collective behaviour of social animals, such as birds flocking or fish schooling. Algorithms like Particle Swarm Optimisation (PSO) and Ant Colony Optimisation (ACO) fall under this category.
Basically, these algorithms have a swarm of agents that move around in the search space, guided by their own best-known position and the whole swarm's best-known position.
When improved positions are found, the whole swarm is moved towards them. The process is repeated and by doing so it is hoped, but not guaranteed, that a satisfactory solution will eventually be discovered @zhang2015comprehensive.

The distinctive feature of evolutionary algorithms lies in their robustness and flexibility. Unlike traditional optimisation methods, EAs do not require gradient information or continuity of the search space. They are highly adaptable, capable of finding global optima in complex, multimodal landscapes where other algorithms might get trapped in local optima. Moreover, EAs can be parallelised effectively, making them suitable for solving large-scale problems across diverse domains, from engineering and economics to biology and artificial intelligence. @whitley1996evaluating

=== NEAT

NeuroEvolution of Augmenting Topologies (NEAT) is a genetic algorithm for the generation of artificial neural networks. It was developed by Kenneth O. Stanley and Risto Miikkulainen in 2001 @NEAT. 
The peculiarity of NEAT is that it addresses three major challenges of TWEANNs:
+ Is there a genetic representation that allows disparate topologies to crossover in a meaningful way?
+ How can topological innovation that needs a few generations to optimize be protected so that it does not disappear from the population prematurely?
+ How can topologies be minimised throughout evolution without the need for a specially contrived fitness function that measures complexity?

Compared to the traditional genetic algorithms, NEAT has three key differences:

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Genetic Encoding]
#figure(
  image("/images/basics/neat1.png", width: 70%),
  caption: [The scheme NEAT uses for its genomes @NEAT]
) <neat1>
The individuals in NEAT are called genomes, based upon the biological term, which is the complete genetic information of an organism.
As shown in @neat1, each genome contains a list of node genes and one of connection genes, that specify the in-node and out-node as well as contain information about the connection's weight, the innovation number, and whether the connection is enabled or not.
The innovation number identifies the original historical ancestor of each gene, which allows finding corresponding genes during crossover.

The weight mutation in NEAT functions as in any neuroevolution system, with each connection either perturbed or not.
The structural mutation can occur in two ways depicted in @neat2:

#figure(
  image("/images/basics/neat2.png", width: 70%),
  caption: [The two ways of structural mutation in NEAT @NEAT]
) <neat2>

Adding a connection is done by expanding the list of connection genes with one connecting two previously unconnected nodes.
A node is added by splitting an existing connection into two, with the new node in between.
The old connection gene is disabled and two new connection genes are added.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Tracking Genes through Historical Markings]
The tracking of the origins of a gene is done by the aforementioned innovation number.
Whenever a new gene appears through structural mutation, the global innovation number is incremented and assigned to the new gene.
@neat3 shows the crossover of two genomes:

#figure(
  image("/images/basics/neat3.png", width: 70%),
  caption: [The matching of genes during crossover in NEAT; \ The innovation number is shown on top of each parent @NEAT]
) <neat3>

Thanks to the innovation number, the algorithm knows which genes match up and represent the same structure during crossovers.
Genes that do not match are either disjoint or excess, depending on if they occur within the innovation numbers of the other genome.
If genes are not matching up, they are inherited from the fittest parent or randomly chosen if both parents have the same fitness.
This way, NEAT can crossover genomes with different topologies without the need for any topological analysis.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Protecting Innovation through Speciation]
Adding a new structure to a genome can be detrimental to its fitness, as the new structure tends to be unoptimised.
To prevent the genome with the new structure from being eliminated too quickly, NEAT uses speciation.
The population is divided into species based on their topological similarity, which
can be measured by the number of disjoint $D$ and excess $E$ genes and the average weight difference for matching genes $overline(W)$:
$ delta = (c_1 dot E)/ N + (c_2 dot D)/N + c_3 dot overline(W) . $
The coefficients $c_1$, $c_2$, and $c_3$ are constants that determine the importance of the three factors and the factor $N$ -- the  number of genes in the larger genome -- normalises for genome size.

Genomes are tested for compatibility with a species calculating their $delta$ to a random member of the species and if the $delta$ is below a threshold, the genome is added to the species. Genomes are placed into the first species that fits.

NEAT uses explicit fitness sharing, where organisms in the same species share their niche's fitness, preventing any one species from dominating. Fitness is adjusted by dividing by the number of individuals in the species. 
Species grow or shrink based on whether their average adjusted fitness is above or below the population average:
$ N'_j = (sum_(i=1)^N_j f_(i j))/overline(f) , $
where $N_j$ and $N'_j$ are the old and new size of species $j$, $f_(i j)$ is the adjusted fitness of individual $i$ in species $j$, and $overline(f)$ is the mean adjusted fitness of the entire population.
The best performing $r%$ of each species is randomly mated to generate $N'_j$ offsprings, replacing the entire species.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Minimizing Dimensionality]
TWEANN algorithms usually start with a population of random topologies to introduce diversity, as new structures often do not survive without protection. However, this diversity may be unnecessary and costly, as random topologies contain untested structures. Optimizing these complex structures increases the search dimensions, potentially wasting effort.
Thus, NEAT starts with a uniform population of simple networks with no hidden nodes.
By using speciation to protect innovation, NEAT can grow new structures incrementally as needed. Only useful structures survive through fitness evaluations, reducing the number of weight dimensions and generations needed to find a solution.

\
Each of these features introduced by NEAT has been shown to be necessary as NEAT performs significantly worse when one of them is removed @NEAT.
Through these innovations, NEAT quickly became the most popular and widely used algorithm in neuroevolution,
its feats amongst many others being used to find the most accurate mass estimate of the top quark or controlling Mario in Super Mario Bros @oreillyNeuroevolutionDifferent.