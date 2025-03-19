
#let experiment = (
  table(
    columns: 2,
    table.header([*Parameter*], [*Value*]),
    [Net], [CIGRE],
    [Amount Steps], [100 Days (8.640.000 seconds)],
    [Episodes], [3],
    //[Amount Steps], [1 Year (31.536.000 seconds)],
    //[Episodes], [10],
    [Reward Function], [ExtendedGridHealthReward],
    [Step size], [900]
  )
)

#let sac = (
  table(
    columns: 2,
    //table.header([], [*Attacker*], [*Defender*]),
    //table.hline(stroke: 2pt),
    [Objective],[ArlDefenderObjective/\ COHDARLObjective],
    [batch_size], [1000],
    [fc_dims], [[48, 48]],
    [gamma], [0.99],
    [learning rate], [0.003],
    [replay_size], [1e6],
    [update_after], [1000 | 0],
    //[update_every], [50],
    [update_every], [25],
    [muscle start_steps], [1000 | 0],
  )
)

#let neat = (
  table(
    columns: 3,
    table.header([], [*Parameter*], [*Value*]),
    table.cell(rowspan: 6, align: horizon, rotate(-90deg, reflow: true)[Genome]),
    //[Runs per genome], [50],
    [Runs per genome], [20],
    [NUM_INPUTS], [Amount of Sensors],
    [NUM_OUTPUTS], [Amount of Actuators],
    [USE_BIAS], [True],
    [ACTIVATION], [ReLu],
    [SCALE_ACTIVATION], [4.9],
    table.hline(stroke: 2pt),
    table.cell(rowspan: 4, align: horizon, rotate(-90deg, reflow: true)[Population]),
    [FITNESS_THRESHOLD], [1000],
    [POPULATION_SIZE], [100],
    [NUMBER_OF_GENERATIONS], [15],
    // [POPULATION_SIZE], [150],
    // [NUMBER_OF_GENERATIONS], [30],
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
    [NAS runs], [50],
    // [NAS runs], [300],
    [Runs per network], [20],
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
    [Runs per network], [20],
    [INIT_POINTS], [20],
    [N_ITER], [30],
    // [INIT_POINTS], [100],
    // [N_ITER], [200],
  )
)