#import "/images/diagrams.typ": concept, neatnas, rlnas, bonas

= Concept

== Concept
#v(-4em)
#figure(
  scale(50%)[#concept],
  gap: -4em,
  caption: [Adding NAS to the palaestrAI learning cycle]
) <concept>
#v(2em)
- #link(<big_loop>)['Big Loop'] not possible
#sym.arrow.r.filled Break up NAS algorithm to run within learning loop

- After the NAS finishes, use best performing network to continue with 'normally'

== NEAT

#columns(2)[
    #[
      0. Population is generated during setup
      + Network is taken from population and run several times
      + Resulting rewards are used to determine fitness (average)
      + When every network has been run, select the best performing networks
      + Generate new population
      + Go to 1. until 'satisfied'  \ i.e. fitness over specified threshold or reaching a number of generations
    ]
    #colbreak()
    #v(-2em)
    #figure(
      scale(60%)[#neatnas],
      gap: -1em,
      caption: [NEAT concept]
    ) <neat_concept>
]

== RL 

#columns(2)[
    #[
      + RL generates a list of 'actions' \ (e.g. `0: 2, 1: 4, ..., 10: 'ReLu', ...`)
      + Actions are used to create a network
      + Network is run through cycle, trained 'normally' 
      + Loss and rewards are used as feedback to the RL algorithm
      - Repeats until a set amount of iterations finishes
      - Select best performing network
    ]
    #colbreak()
    #v(-2em)
    #figure(
      scale(60%)[#rlnas],
      gap: -1em,
      caption: [RL approach]
    ) <rl_concept>
]

== BO

#columns(2)[
    #[
      - Black-box function is made of an encoding of the network
        - e.g. a, b, c with bounds (0, 256) representing the hidden layers

      - BO algorithms proposes set of parameters
      - Parameters are used to create network
      - Network is run through cycle, trained 'normally'
      - BO uses reward to improve model
    ]
    #colbreak()
    #v(-2em)
    #figure(
      scale(60%)[#bonas],
      gap: -1em,
      caption: [BO approach]
    ) <bo_concept>
]