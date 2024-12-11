Soft Actor-Critic (SAC) is an off-policy deep reinforcement learning algorithm developed for continuous control tasks.
SAC uses a setup with an actor and a critic.
The actor outputs a probability distribution over actions, emphasizing randomness for exploration, and is used to act in the environment.
The critic evaluates the expected cumulative reward (Q-value) for a given state-action pair, augmented by the entropy term and is used to learn from the actions of the actor.
This setup of using different networks to act and learn is known as off-policy and has the advantage of reusing experiences from a replay buffer, enhancing sample efficiency for example as data can be repurposed multiple times without requiring new interactions with the environment for each learning update.

Another key feature of SAC is its maximum entropy framework. Traditional reinforcement learning optimizes the expected cumulative reward. In contrast, SAC augments this objective by maximizing the entropy of the policy. The entropy term encourages exploration by favoring stochastic policies. This makes the algorithm robust and allows it to discover multiple modes of optimal behavior. The entropy bonus is weighted by a temperature parameter, balancing exploration and exploitation.
Additionally, the temperature parameter is automatically adjusted to maintain a target level of entropy, eliminating the need for manual tuning and adapting exploration based on the task's complexity.

SAC has been successfully applied to various benchmark environments, outperforming both on-policy algorithms like PPO and off-policy algorithms like DDPG and TD3. It combines high sample efficiency, stability, and robustness, making it suitable for real-world tasks such as robotic locomotion and manipulation. @haarnoja2018soft
