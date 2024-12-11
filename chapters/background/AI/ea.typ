Evolutionary algorithms (EAs) are a subset of artificial intelligence (AI) techniques inspired by the mechanisms of biological evolution. These algorithms are employed to solve optimization and search problems by simulating the process of natural selection, where the fittest individuals are selected for reproduction to produce the next generation of solutions.

(HISTORY | If useful get sources else remove) \
The conceptual roots of evolutionary algorithms date back to the 1950s and 1960s, influenced heavily by the works of John Holland, Ingo Rechenberg, and Lawrence Fogel. John Holland's seminal book, "Adaptation in Natural and Artificial Systems" (1975) @sampson1976adaptation, laid the groundwork for genetic algorithms (GAs), a prominent class of EAs. In parallel, Ingo Rechenberg and Hans-Paul Schwefel in Germany were pioneering evolutionary strategies (ES), another critical branch of EAs, through their work on optimisation problems in engineering. Lawrence Fogel's evolutionary programming (EP) further diversified the field by focusing on the evolution of finite state machines and problem-solving strategies.

Evolutionary algorithms typically go through a circle of following steps:
+ Initialisation: A population of potential solutions (individuals) is generated, often randomly.
+ Evaluation: Each individual’s fitness is assessed based on a predefined fitness function.
+ Selection: Individuals are selected for reproduction based on their fitness, favouring the fittest individuals.
+ Crossover: Selected individuals are paired, and their genetic material is recombined to produce offspring with mixed traits.
+ Mutation: Offspring undergo random mutations to introduce new genetic variations.
+ Replacement: The new generation replaces the old population, and the cycle repeats until a stopping criterion is met (e.g., a solution is found or a maximum number of generations is reached).

By going through this cycle iteratively, evolutionary algorithms mimic the process of natural selection, where the fittest individuals are more likely to survive and pass on their genetic material to the next generation. Over time, the population evolves towards better solutions.
Ideally, the population converges towards the global optimum, representing the best solution to the optimisation problem, but early stopping criteria like a predetermined threshold are often used to prevent overfitting or stagnation.

Evolutionary algorithms may be classified into three subcategories, each inspired by different evolutionary theories.
Firstly, there are Darwinian Evolution algorithms, which are rooted in Charles Darwin's theory of natural selection. These algorithms emphasise survival of the fittest, where individuals are selected based on their fitness, and crossover and mutation create variation. Genetic algorithms (GAs) are a primary example of this approach.
Secondly, Lamarckian Evolution algorithms are based on Jean-Baptiste Lamarck's theory, which posits that traits acquired during an individual's lifetime can be passed to offspring. In EAs, this translates to individuals that can adapt and improve within their lifetime before passing on their enhanced traits, merging the ideas of learning and evolution.
Lastly, there are Swarm Intelligence algorithms, inspired by the collective behaviour of social animals, such as birds flocking or fish schooling. Algorithms like Particle Swarm Optimisation (PSO) and Ant Colony Optimisation (ACO) fall under this category. These algorithms utilise simple agents that interact locally with one another and with their environment, leading to the emergence of complex, intelligent behaviour at the global level.

The distinctive feature of evolutionary algorithms lies in their robustness and flexibility. Unlike traditional optimisation methods, EAs do not require gradient information or continuity of the search space. They are highly adaptable, capable of finding global optima in complex, multimodal landscapes where other algorithms might get trapped in local optima. Moreover, EAs can be parallelised effectively, making them suitable for solving large-scale problems across diverse domains, from engineering and economics to biology and artificial intelligence.
