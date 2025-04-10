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

    ]
    #colbreak()
    #figure(
        image("/images/basics/neural_network.png", width: 100%),
        caption: [A basic representation of a neural network #image-link("https://commons.wikimedia.org/wiki/File:Ann_dependency_(graph).svg")]
    ) <pic2>
]

#pagebreak()

#columns(2)[
    #[

    ]
    #colbreak()
    #figure(
        scale(100%)[#neurons],
        caption: "asdasdf"
    ) <pic3>
]


== Reinforcement Learning

#columns(2)[
    #[

    ]
    #colbreak()
    #import "/images/diagrams.typ": feed_loop
    #figure(
        scale(90%)[#feed_loop],
        caption: "asddaagdf"
    ) <pic4>
]


== Soft Actor-Critic

#lorem(20)

== Neuroevolution

#columns(2)[
    #[
        
    ]
    #colbreak()
    #figure(
        image("/images/basics/gadiagram.svg", width: 100%),
        caption: [asdsdasd @clauset2011brief]
    ) <pic5>
]

== NEAT

#lorem(20)

== Bayesian optimisation

#lorem(20)