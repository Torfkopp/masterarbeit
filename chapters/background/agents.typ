An agent is an autonomous computer system capable of perceiving its environment and deciding upon action in it to fulfil their given role and objective.
Agents are designed to operate independently and without human intervention on its decisions and task performance. 
The functionality of an agent can be split into three parts:
1. Sensing: The agent perceives the environment through its sensors and thus gathers data from their surroundings.
2. Processing: The agent processes the gathered information, assesses the state of the environment and then makes a decision based on predefined rules or learned experiences.
3. Acting: By using their actuators, the agent is able to perform the action decided upon in the environment.

A modern example of an agent is the robotic vacuum cleaner, which has a designated area to be cleaned by it -- the environment --, sensors like cameras or infrared sensors, and actuators in form of motors for driving and vacuuming. The robot's objective is to clean its territory, which it achieves independently. @wooldridge2009introduction

Agents are intelligent, when they are capable of flexible autonomous actions. 'Flexible' means, that the agent is capable of reactivity, by responding to changes in the environment;
pro-activeness, by exhibiting goal-directed behaviour and taking the initiative in order to satisfy their design objectives; and social ability, by interacting with other agents (and possibly humans). @wooldridge1999intelligent

=== Multi-Agent Systems (MAS)

The latter makes it also possible to form systems of multiple agents, called multi-agent system (MAS). In a MAS several agents with different objectives, information, and abilities work together towards a single collective objective. Thus, these MAS are able of solving complex problems that lie beyond the capabilities of a single agent.
Besides the coordination and collaboration of the agents, MAS as a whole are -- like a single agent -- also able to adapt to changes in the environment, making them flexible. Furthermore, MAS are decentralised, meaning that control and decision-making are distributed amongst multiple agents rather than centralised in a single entity, making the system more robust by avoiding single points of failure for example.
Due to consisting of multiple single entities that take over different tasks, MAS have a great scalability and are capable of parallelism. @balaji2010introduction

MAS are used in several different fields and have many applications.
For example, in cloud computing, MAS are employed for resource monitoring, ensuring optimal load distribution on Virtual Machines based on predefined policies. They enhance security by monitoring and responding to potential threats, assist in discovering available resources within the cloud infrastructure, and manage and automate services to improve efficiency and reliability. \
In healthcare, agents are used to monitor patient health data in real-time, providing timely alerts to healthcare providers, and assist in the allocation of medical resources like hospital beds and medical staff to improve patient care. \
Or in smart grids, where agents manage the energy production, storage, and consumption to enhance efficiency and profitability. Energy producers use agents to analyse price signals and decide whether to store or sell energy. MAS also assist in demand response by adjusting energy usage based on supply conditions. @dorri2018multi