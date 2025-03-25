== harl

harl #footnote("https://gitlab.com/arl2/harl") is repository containing palaestrAI-agents that are capable of machine learning.
Currently, two deep reinforcement learning algorithms are implemented: Proximal Policy Optimisation (PPO) and Soft Actor-Critic (SAC).

The SAC implementation used in harl #footnote("https://gitlab.com/arl2/harl/-/blob/development/src/harl/sac/brain.py") is based on the 'OpenAI Spinning Up in DRL'-implementation #footnote("https://spinningup.openai.com/en/latest/algorithms/sac.html").
It extends the implementation and uses $alpha$-annealing instead of Spinning Up's use of a fixed entropy coefficient $alpha$.
PyTorch #footnote("https://pytorch.org/") is used as the library for machine learning and
ADAM (@adam) is used to optimise the temperature $alpha$, the policy $pi$, and the Q-function $Q$.