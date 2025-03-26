= Conclusion

The goal of this thesis was to confirm the hypothesis that a NAS algorithm 
can improve upon the performance of a user-picked architecture in a reasonable amount of time in the ARL architecture
by implementing three different NAS methods 
-- NEAT, a Bayesian optimisation, and a reinforcement learning based approach --
into the SAC implementation of the palaestrAI framework
and comparing their performance to a baseline agent in a simulated power system environment with ARL.

The two experiments conducted either confirm this hypothesis in case of the first experiment
or do not confirm the hypothesis in case of the second experiment.
Due to the first experiment not being able to show a learning baseline, the results of the second experiment
are more reliable than the first experiment's results.
Thus, the hypothesis can not be confirmed.
More experimentation and investigation is needed in order to identify
whether the reason for the NAS methods' performance is due to a faulty implementation
of the NAS methods into the harl framework or if the NAS methods are simply not able to handle the task at hand.
