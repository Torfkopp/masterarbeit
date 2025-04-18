#import "../template/util.typ": *

= Conclusion

== Evaluation

- Contrary results: 1#super[st] experiment agrees to hypothesis, 2#super[nd] does not

- In both experiments, the NAS methods do not learn
  - Baseline also does not learn in 1#super[st] experiment \ #sym.arrow.r.filled Experiment might not work as intended
  - Either: Implementation of NAS methods not correct or \ task not suitable for NAS methods \ #sym.arrow.r.filled More research needed

- NEAT had a problem in the 2#super[nd] experiment when fitted all actuators
  - Stopped after first step; due to the unique network structure in NEAT's impl.
  - Fewer actuators were used, hence the significantly worse performance 

== Further Work

- BO approach has big room for improvement
  - Black-box function used has 6 parameters, each between 0 and 256
  - Baseline used 2 hidden layers with 48 features
  #sym.arrow.r.filled Improving function may speed up learning and perform better

- Changing the NEAT implementation's network to one more compatible

- Duration of the NAS could be set automatically

- Other algorithms could be tested

#source[@kavzoglu1999determining]

== Conclusion

#update-last-slide-counter()

- Goal of thesis was to confirm the hypothesis :
#v(-1em)
#quote[a NAS algorithm can improve upon the performance of a user-picked architecture in a reasonable amount of time in the ARL architecture]
#v(1em)
- The hypothesis was confirmed in the 1#super[st] experiment, but not in the 2#super[nd]
- 1#super[st] experiment did not show a learning baseline, thus 2#super[nd] is more meaningful

#v(2em)
#sym.arrow.r.filled The hypothesis cannot be confirmed, \ further research may lead to satisfactory results
