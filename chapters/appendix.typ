#import "../images/tables.typ": experiment, neat, sac, rl, bo

#heading(numbering: none)[Appendix] <appendix>
#figure(image("/images/cigre.png", width: 50%), caption: [CIGRE benchmark grid used @rudion2006cigre]) <cigre>

#figure(
  scale(70%, reflow: true)[#experiment],
  caption: [Experiment parameters],
) <exp_paras>

#figure(
  scale(70%, reflow: true)[#sac],
  caption: [SAC parameters],
) <sac_paras>

#figure(
  scale(70%, reflow: true)[#neat],
  caption: [NEAT parameters],
) <neat_paras>

#figure(
  scale(70%, reflow: true)[#rl],
  caption: [RL based NAS parameters],
) <rl_paras>

#figure(
  scale(70%, reflow: true)[#bo],
  caption: [BO parameters],
) <bo_paras>