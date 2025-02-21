
#let experiment = (
  table(
    fill: red,
    columns: 2,
    table.header([*Parameter*], [*Value*]),
    [Experiment], [],
    [Amount Steps], [1 Year (31.536.000 seconds)],
    [Steps per Episode], [],
    [Reward Function], [ExtendedGridHealthReward],
    [Step size], [900]
  )
)

#let sac = (
  table(
    columns: 2,
    //table.header([], [*Attacker*], [*Defender*]),
    table.hline(stroke: 2pt),
    [Objective],[Objective/\ COHDARLObjective],
    [batch_size], [1000],
    [gamma], [0.99],
    [learning rate], [0.003],
    [replay_size], [1e6],
    [update_after], [1000],
    [update_every], [50],
    [muscle start_steps], [#text(fill:red)[1000]],
  )
)

#let neat = (
  table(
    columns: 3,
    table.header([], [*Parameter*], [*Value*]),
    table.cell(rowspan: 5, align: horizon, rotate(-90deg, reflow: true)[Genome]),
    [NUM_INPUTS], [Amount of Sensors],
    [NUM_OUTPUTS], [Amount of Actuators],
    [USE_BIAS], [True],
    [ACTIVATION], [ReLu],
    [SCALE_ACTIVATION], [4.9],
    table.hline(stroke: 2pt),
    table.cell(rowspan: 4, align: horizon, rotate(-90deg, reflow: true)[Population]),
    [FITNESS_THRESHOLD], [#text(fill:red)[16.8]],
    [POPULATION_SIZE], [150],
    [NUMBER_OF_GENERATIONS], [15],
    [SPECIATION_THRESHOLD], [3.0],
    table.hline(stroke: 2pt),
    table.cell(rowspan: 7, align: horizon, rotate(-90deg, reflow: true)[Algorithm]),
    [CONNECTION_MUTATION_RATE], [0.80],
    [CONNECTION_PERTURBATION_RATE], [0.90],
    [ADD_NODE_MUTATION_RATE], [0.03],
    [ADD_CONNECTION_MUTATION_RATE], [0.5],
    [CROSSOVER_REENABLE_CONNECTION_GENE_RATE], [0.25],
    [PERCENTAGE_TO_SAVE], [0.30],
    [FITNESS_FUNC], [AVG],
  )
)

#let rl = (
  table(
    columns: 2,
    table.header([*Parameter*], [*Value*]),
    [Runs per network], [],
    [NUM_ACTIONS], [16],
    [INDEX_TO_ACTION], [
      0: 1,
      1: 2,
      2: 4,
      3: 8,
      4: 16,
      5: 32,
      6: 64,    
      7: 128, 
      8: 256,
      9: 512,
      10: 1024, \
      11: "Sigmoid",
      12: "Tanh",
      13: "ReLU",
      14: "LeakyReLU",
      15: "EOS"
    ],
    [HIDDEN_SIZE], [64],
    [EPSILON], [0.8],
    [GAMMA], [1.0],
    [BETA], [0.01],
    [MAX_DEPTH], [6],
    [CLIP_NORM], [0],
  )
)

#let bo = (
  table(
    columns: 2,
    table.header([*Parameter*], [*Value*]),
    [Runs per network], [],
    [INIT_POINTS], [],
    [N_ITER], [],
    [BLACK_BOX_FUNCTION], [],
    [P_BOUNDS], [],
  )
)