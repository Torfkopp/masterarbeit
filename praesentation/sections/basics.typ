#import "/praesentation/template/util.typ": *
= Basics

== Agents

#columns(2)[
    #[
        - Autonomous computer system
        - Functions:
            + Sensing
            + Processing
            + Acting
        \
        - Five classes:
            - Simple reflex
            - Model-based reflex
            - Goal-based
            - Utility-based
            -  Learning
    ]
    #colbreak()
    #figure(
    image("/images/basics/agents.png", width: 100%),
    caption: [A depiction of an agent with its core functions after Russell and Norvig #image-link("https://www.researchgate.net/figure/ntelligent-Agents-Russell-and-Norvig-2009_fig2_303545602")]
    ) <pic1>
    #v(1fr)
    #source[@russell2016artificial @wooldridge1999intelligent @wooldridge2009introduction]
]


== Deep Learning

#import "/images/diagrams.typ": neurons,

#columns(2)[
    #[
        - Refers to the use of #emph[neural networks]
        - Based upon the human brain
        -> Multiple layers of interconnected Neurons 
        #v(10%)
        - Input layer gets data
        - Hidden layers used for calculation
        - Output layer gives result
    ]
    #colbreak()
    #figure(
        image("/images/basics/neural_network.png", width: 100%),
        caption: [A basic representation of a neural network #image-link("https://commons.wikimedia.org/wiki/File:Ann_dependency_(graph).svg")]
    ) <pic2>
    #source[@anderson1995introduction @heaton2011introduction]
]

#pagebreak()

#columns(2)[
    #[
        - A neuron has at least one input as well as one output
        - Each connection has a weight
        - Each neuron has an activation function
            - e.g. $tanh(x)$ or $"ReLU"(x) = max(0,x)$
         
        - Formula: $ h_1 = A(sum_(c=1)^n (i_c * w_c) ) $
        - Learning is done by changing weights
    ] 
    #colbreak()
    #figure(
        scale(90%)[#neurons],
        caption: [A single hidden neuron with its inputs]
    ) <pic3>
    #source[@heaton2011introduction @anderson1995introduction]
]


== Reinforcement Learning
The Bellman principle of optimality is a central part of reinforcement learning:
  #quote(attribution: [Richard Bellman], block: true)["An optimal policy has the property that whatever the initial state and initial decision are, the remaining decisions must constitute an optimal policy with regard to the state resulting from the first decision."]

or, as equation:
$ V^pi^*(x) = max_a [Re_x(a) + gamma sum_(y)P_"xy" (a)V^pi^*(y)] $ 

#sym.arrow.r.filled An optimal policy is achievable by doing the best action in each state
#source[@bellman1954theory]

#pagebreak()

#columns(2)[
    #[
        + Agent interacts with the environment
        + Agent receives reward based on its actions
        + Agent tries to maximise reward
        #sym.arrow.r.filled Agent learns

        Two approaches:
        - On-Policy: learning, acting in 1 policy
        - Off-Policy: 1 learning, 1 acting policy
        #sym.arrow.r.filled Off-Policy is generally more stable and simpler, but cannot reuse data samples, hence less data efficient
    ]
    #colbreak()
    #import "/images/diagrams.typ": feed_loop
    #figure(
        scale(80%)[#feed_loop],
        caption: [The feedback-loop of RL algorithms]
    ) <pic4>
    #source[@puiutta2020explainable]
]

== Soft Actor-Critic

- Off-Policy, actor-critic RL algorithm
- Not only maximises the expected reward, \ but also the entropy $H(pi)$ of the policy:
$ pi^* = arg max_pi EE [sum_(t=0)^infinity gamma^t lr(( r_t + alpha H (pi (dot|s_t)) ), size: #200%)] $
- Concurrently learns a stochastic policy $pi_theta$ and two Q-functions $Q_phi.alt_1$ and $Q_phi.alt_2$
    - Stochastic policy (actor): represents the probability of taking action $a$ in state $s$
    - Q-Function (critic): using the Bellman equation, estimates long-term reward for taking action $a$ in state $s$ and following policy $pi$ afterwards 

#source[@haarnoja2018soft @haarnoja2018soft2]

== Neuroevolution

#columns(2)[
    #[
        - Uses an evolutionary process to evolve neural networks:
        + Create population of individuals
        + Rate each individual's performance at the task with a fitness score
        + Select the fittest individuals
        + Create new individuals with the selected ones
        + Repeat steps 2-5 until satisfied
    ]
    #colbreak()
    #figure(
        image("/images/basics/gadiagram.svg", width: 100%),
        caption: [A diagram showing the steps of a genetic algorithm #image-link("https://www.strong.io/blog/evolutionary-optimization")]
    ) <pic5>
    #source[@oreillyNeuroevolutionDifferent]
]

== NEAT

- NeuroEvolution of Augmenting Topologies
- Developed by Kenneth O. Stanley and Risto Miikkulainen in 2001

- TWEANN (Topology and Weight Evolving Artificial Neural Networks) algorithm

- Upgrades the known TWEANN algorithms with 3 key features

#source[@NEAT]

#pagebreak()

#columns(2)[
    #[
        - Genetic Encoding
        - Historical Markings
            - Allows for crossover of different topologies
        - Speciation
            - New, unoptimised structures are bad for fitness
            - Grouping similar individuals and compare in  group
        - Minimising Dimensionality
            - Starts with simple networks and increases complexity
    ]
    #colbreak()
    #figure(
        image("/images/basics/neat1.png", width: 80%),
        caption: [The scheme NEAT uses for its genomes]
    )
    #source[@NEAT]
]

== Bayesian optimisation

#columns(2)[
    - Strategy for global optimisation of black-box function $f(x)$
    - Two functions
        - surrogate function (statistical model): \ best guess of the form of $f(x)$
        - acquisition function: \ directs the exploration of the space
    #colbreak()
    #import "@preview/algo:0.3.6": algo, i, d, comment, code
    #v(-0.8em)
    #figure(
        scale(100%)[
        #algo(
            header: [
            #set text(font: "Libertinus Serif", weight: "bold")
            #smallcaps("Bayesian Optimisation")\ 
            #v(-1.5em) #repeat("_")
            ],
            main-text-styles: (size: 10pt),
            comment-styles: (size: 10pt),
            line-numbers: false,
            indent-size: 20pt,
            keywords: ("for", "do", "end"),// "select", "query", "augment", "update"),
            inset: 5pt,
            column-gutter: 10pt
        )[
            for $n = 1, 2, ...$ do#i\
            select new $x_(n+1)$ by optimising acquisition function $alpha$: #i\
            $x_(n+1) = arg max_x alpha (x; cal(D)_n)$ #d\
            query objective function to obtain #i\ $y_(n+1) = f(x_(x+1))$ #d\
            augment data set #i\ $cal(D)_n = {cal(D)_n, (x_(n+1), y_(n+1))}$ #d\
            update statistical model #d\
            end for 
        ]]
    )
]
#source[@shahriari2015taking]

== Neural Architecture Search

#columns(2)[
    #[
        - Tries to automate the design of neural network architectures
        - Several possible approaches:
            - Reinforcement learning
            - Evolutionary algorithms
            - Gradient-based optimisation
        
        - NAS were successfully used in several applications and studies
        - But most NAS applications focus on image classification tasks
    ]
    #colbreak()
    #figure(
        image("/images/basics/ea_in_rl.png", width: 100%),
        caption: [How a evolutionary algorithm is used to optimise RL]
    )
    #source[@bai2023evolutionary @liu2021survey @elsken2019neural @fu2020auto @mazyavkina2021optimizing]
]
