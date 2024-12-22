#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

#import fletcher.shapes: pill

#let concept = (
  diagram(
    debug: false,
    node-fill: gradient.radial(white, green, radius: 200%),
    node-stroke: green,
    node(
      align(top + right)[Current], enclose: (<env>, <brain>, <muscle>), name: <old>,
    ),
    node((0,0), "Env", shape: pill, name: <env>),
    edge("-|>", label: "reward", label-side: left),
    node((0,2), "Brain", shape: pill, name: <brain>),
    edge("-|>", label: "network"),
    node((2,2), "Muscle", shape: pill, name: <muscle>),
    edge("-|>", <env>, label: "actions"),

    edge((2.2, 1.5), (4, 1.5), "=>", stroke: 1pt),

    node(
      align(top + right)[With NAS], enclose: (<env2>, <brain2>, <muscle2>, <nas>), name: <new>,
    ),
    node((4,0), "Env", shape: pill, name: <env2>),
    edge("-|>", label: "reward", label-side: left),
    node((4,2), "Brain", shape: pill, name: <brain2>),
    edge("-|>", label: "network"),
    node((6,2), "Muscle", shape: pill, name: <muscle2>),
    edge("-|>", <env2>, label: "actions"),
    node((5,3), "NAS", shape: pill, name: <nas>),
    edge(<brain2>, <nas>, "-|>", label: "", bend: 30deg),
    edge(<nas>, <brain2>, "-|>", label: "", bend: 30deg),
  )
)

#let neatnas = (
  diagram(
    debug: false,
    node-fill: gradient.radial(white, green, radius: 200%),
    node-stroke: green,
    node((0,0), "Env", shape: pill, name: <env>),
    edge("-|>", label: "reward", label-side: left),
    node((0,2), "Brain", shape: pill, name: <brain>),
    edge("-|>", label: "network"),
    edge(<eval>, "-|>", label: "reward", label-side: right),
    node((2,2), "Muscle", shape: pill, name: <muscle>),
    edge("-|>", <env>, label: "actions"),

    node(
      align(bottom+right)[#text(black)[NEAT]], stroke: green, enclose: (<eval>, <sel>, <pop>, <gen>, (2,4)),
    ),
    node((0,3), "Evaluate", shape: pill, name: <eval>),
    node((0,4), "Select", shape: pill, name: <sel>),
    node((1,3), "Population", shape: pill, name: <pop>),
    node((1,4), "Generate", shape: pill, name: <gen>),

    edge(<eval>, <pop>, "--|>", label: ""),
    edge(<eval>, <sel>, "-|>", label: ""),
    edge(<sel>, <gen>, "-|>", label: ""),
    edge(<gen>, <pop>, "-|>", label: ""),
    edge(<pop>, <brain>, "-|>", label: "Network"),
  )
)

#let rlnas = (
  diagram(
    debug: false,
    node-fill: gradient.radial(white, green, radius: 200%),
    node-stroke: green,
    node((0,0), "Env", shape: pill, name: <env>),
    edge("-|>", label: "reward", label-side: left),
    node((0,2), "Brain", shape: pill, name: <brain>),
    edge("-|>", label: "network"),
    edge("-|>", <rollout>, label: [reward, \ loss], label-side: left),
    node((2,2), "Muscle", shape: pill, name: <muscle>),
    edge("-|>", <env>, label: "actions"),

    node(
      align(bottom+right)[#text(black)[RL]], stroke: green, enclose: (<rollout>, <gen>), name: <rl>,
    ),
    node((0,4), "Rollout", shape: pill, name: <rollout>),
    edge(<rollout>, <gen>, "-|>", label: "actions", label-side: right),
    node((1,3), "Generate Network", shape: pill, name: <gen>),
    edge(<gen>, <brain>, "-|>", label: "actions"),
  )
)

#let bonas = (
  diagram(
    debug: false,
    node-fill: gradient.radial(white, green, radius: 200%),
    node-stroke: green,
    node((0,0), "Env", shape: pill, name: <env>),
    edge("-|>", label: "reward", label-side: left),
    node((0,2), "Brain", shape: pill, name: <brain>),
    edge("-|>", label: "network"),
    edge(<bo>, "-|>", label: "reward", label-side: left),
    node((2,2), "Muscle", shape: pill, name: <muscle>),
    edge("-|>", <env>, label: "actions"),

    node(
      align(bottom+right)[#text(black)[BO]], stroke: green, enclose: (<bo>, <para>, <network>, (2,4)),
    ),
    node((0,4), "BO", shape: pill, name: <bo>),
    node((1,4), "Parameters", shape: pill, name: <para>),
    node((1,3), "Network", shape: pill, name: <network>),
    edge(<bo>, <para>, "-|>", label: "eh", label-side: left),
    edge(<para>, <network>, "-|>", label: "öh"),
    edge(<network>, <brain>, "-|>", label: "äh"),
  )
)

#concept