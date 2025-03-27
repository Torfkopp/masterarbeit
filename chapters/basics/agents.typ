
== Agents
#figure(
  image("/images/basics/agents.png", width: 70%),
  caption: [A depiction of an agent with its core functions \ after Russell and Norvig @russell2016artificial #footnote("https://www.researchgate.net/figure/ntelligent-Agents-Russell-and-Norvig-2009_fig2_303545602")]
)

An agent is an autonomous computer system capable of perceiving its environment and deciding upon action in it to fulfil their given role and objective.
Agents are designed to operate independently and without human intervention on its decisions and task performance. 
The functionality of an agent can be split into three parts:
1. Sensing: The agent perceives the environment through its sensors and thus gathers data from their surroundings.
2. Processing: The agent processes the gathered information, assesses the state of the environment and then makes a decision based on predefined rules or learnt experiences.
3. Acting: By using their actuators, the agent is able to perform the action decided upon in the environment.

A modern example of an agent is the robotic vacuum cleaner, which has a designated area to be cleaned by it -- the environment --, sensors like cameras or infrared sensors, and actuators in form of motors for driving and vacuuming. The robot's objective is to clean its territory, which it achieves independently @wooldridge2009introduction.

Agents are intelligent, when they are capable of flexible autonomous actions. 'Flexible' means, that the agent is capable of reactivity, by responding to changes in the environment;
pro-activeness, by exhibiting goal-directed behaviour and taking the initiative in order to satisfy their design objectives; and social ability, by interacting with other agents (and possibly humans). @wooldridge1999intelligent

Russell and Norvig @russell2016artificial group intelligent agents into five classes based on their capabilities and perceived intelligence:

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Simple reflex agents]
These agents act only upon what they perceive in the current state of the environment, and not on past states;
a simple if condition then action approach.
They only succeed when the environment is fully observable and infinite loops may only be avoided if the agent is capable of randomising its actions.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Model-based reflex agents]
By storing its current state, which cannot be seen by the agent, inside, the agent gets a model of the world and knows "how the world works".
Like this, it is able to handle partially observable environments.
The agent chooses its actions in the same way as the simple reflex agent.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Goal-based agents]
Goal-based agents expand the model-based agents by using a "goal" information.
The goal information describe situations that are desirable for the agent
and the agent tries to reach these goals with its chosen actions.
While sometimes less efficient, goal-based agents are more flexible as their decision-making knowledge is explicitly represented and modifiable.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Utility-based agents]
Goal-based agents only distinguish between goal states and non-goal states. 
It is possible to define a measure of how desirable a particular state is by using a utility function, which maps a state to a measure of the utility of the state.
They choose actions that maximise their expected utility, allowing for more nuanced decision-making in complex environments.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Learning agents]
Learning enables agents to operate in unknown environments and improve beyond their initial knowledge. 
The key components are the "learning element", which makes improvements, and the "performance element", which selects actions. The learning element uses feedback from the "critic" to adjust the performance element for better future actions. 
The "problem generator" suggests actions to gain new and informative experiences.