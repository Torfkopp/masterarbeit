#import "../template/util.typ": *
= Experiment

== Experiment

#columns(2)[
  #[
    - All 3 NAS and baseline were tested
    - CIGRE Net is used
    - NAS algorithm as defender, no attacker
    - Task: keeping the power grid stable
 
    1#super[st] Experiment:
    - ARL Defender Objective
    - 3 episodes à 100 days simulated
    - step size of 900

    2#super[nd] Experiment:
    - COHDARL Defender Objective
    - 15,000,000 seconds per episode
  ]
  #colbreak()
  #figure(
    image("/images/cigre.png", width: 80%),
    caption: [CIGRE Net]
  ) <exp1>
  #source[@rudion2006cigre]
]

== Result Experiment 1

#columns(2)[
  #[
    - RL takes 2:11h, NEAT 2:21h, \ Base 3:12h, BO 3:31h
    - NEAT and RL perform similarly to Baseline (all median reward of 0.709)
     
    - BO performs better (median reward 0.717)

    #v(1em)
    #sym.arrow.r.filled Hypothesis true, NAS algorithms can perform better in a reasonable time
  ]
  #colbreak()
  #figure(
    image("/images/results/cigre_agent_rewards.png", width: 90%),
  )
  #figure(
    image("/images/results/cigre_sperm.png", width: 90%),
  )
]

== Result Experiment 2

#columns(2)[
  #[
    - NEAT takes 2:14h, RL 5:03h, \ Base 7:02h, BO 9:57h
    - NEAT performs worst (1.598) \
    - Base performs best (3.778) 
    
    - Baseline only one that "learns" 

    #v(1em)
    #sym.arrow.r.filled Hypothesis cannot be confirmed, NAS methods do not perform
  ]
  #colbreak()
  #figure(
    image("/images/results/cohdarl_agent_rewards.PNG", width: 100%),
  )
  #figure(
    image("/images/results/cohdarl_spear.PNG", width: 100%),
  )
]