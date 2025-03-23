== Machine Learning <machine_learning>

As shown in @ai_venn, Machine learning (ML) is a subset of artificial intelligence (AI) and it focuses on developing algorithms and statistical models that enable computers to perform tasks without explicit instructions. Instead, these systems learn from data by identifying patterns, making decisions, and improving over time through experience. This capability to learn and adapt autonomously has made machine learning a pivotal technology in various fields, from healthcare and finance to transportation and entertainment.

Machine learning is broadly defined as the study of computer algorithms that improve automatically through experience. Tom M. Mitchell, a prominent figure in the field, provides a more formal definition: "A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P if its performance at tasks in T, as measured by P, improves with experience E" (Mitchell, 1997). This definition highlights three key elements: the task (T), the experience (E), and the performance measure (P). @mitchell1997machine

Machine learning encompasses several types of learning paradigms, each suited to different types of problems and data: @goodfellow2016deep

- Supervised Learning: In supervised learning, the algorithm is trained on a labeled dataset, which means that each training example is paired with an output label. The goal is to learn a mapping from inputs to outputs that can be used to predict the labels of new, unseen data. Common supervised learning algorithms include linear regression, decision trees, and neural networks.

- Unsupervised Learning: Unsupervised learning deals with unlabeled data. The algorithm's goal is to identify underlying patterns or structures in the data without any specific guidance. Techniques such as clustering (e.g. k-means) and dimensionality reduction (e.g. principal component analysis) are typical examples of unsupervised learning.

- Semi-supervised Learning: This approach combines both labeled and unlabeled data to improve learning accuracy. It is particularly useful when labeling data is expensive or time-consuming.

- Reinforcement Learning: In reinforcement learning, an agent interacts with an environment and learns to make decisions by receiving rewards or penalties. The agent's objective is to maximise cumulative rewards over time. This paradigm is often applied in robotics, game playing, and autonomous systems.

Machine learning's ability to analyse vast amounts of data and extract meaningful insights has revolutionised many industries. In healthcare, ML algorithms can predict disease outbreaks, diagnose medical conditions from imaging data, and personalise treatment plans. In finance, they are used for credit scoring, fraud detection, and algorithmic trading. Autonomous vehicles rely on machine learning for navigation, obstacle detection, and decision-making. Additionally, ML powers recommendation systems for online shopping and content streaming platforms, enhancing user experiences by suggesting products and media based on individual preferences. @mitchell1997machine

=== Independent and identically distributed random variables
The independent and identically distributed (iid) assumption is a fundamental concept in statistics and machine learning. 
It means that given a set of data ${x_i}$, each of these $x_i$ observations is an independent draw from a fixed probabilistic model.
Independent means that the probability of observing two values $x_1$ and $x_2$ is the product of the probabilities of observing each value separately. @clauset2011brief
This assumption simplifies the analysis of data and allows for the application of various statistical methods. In machine learning, the iid assumption is often used in the context of training and testing datasets. When the data points are drawn independently from the same distribution, the iid assumption ensures that the model's performance on the training set generalises well to unseen data.

=== Stochastic Gradient Descent

Stochastic Gradient Descent (SGD) is a popular optimisation algorithm used in machine learning
and a modifications of gradient descent.

To explain gradient descent following example is used:\
Taking a loss function $cal(l)(accent(y, hat), y)$ that measures the difference between the predicted output $accent(y,hat)$ and the true output $y$ for a given input $x$ and a family $cal(F)$ of functions $f_omega (x)$ parameterised by a weight vector $omega$. 
A function $f in cal(F)$ that minimises the loss averaged on the examples is sought.
The empirical risk function $E_n (f)$ measures the training set performance:
$ E_n (f) = 1/n sum_(i=1)^n cal(l)(f(x_i), y_i) $
To minimise the empirical risk $E_n (f_omega)$ using gradient descent,
each iteration updates the weights $omega$ on the basis of the gradient of $E_n (f_omega)$:
$ omega_(t+1) = omega_t - gamma 1/n sum_(i=1)^n nabla_omega cal(l)(f_omega_t (x_i), y_i) \, $
where $gamma$ is an adequately chosen gain.

SGD drastically simplifies this process.
Instead of computing the gradient of $E_n (f_omega)$ exactly, each iteration estimates this gradient on the basis of a single randomly picked example $(x_t, y_t)$:
$ omega_(t+1) = omega_t - gamma nabla_omega cal(l)(f_omega_t (x_t), y_t) \. $
The stochastic process ${ w_t, t=1, ...}$ depends on the examples being randomly picked at each iteration.
It is hoped that the SGD calculation behaves like the one in gradient descent. 
Because the stochastic algorithm does not need to remember which examples were visited in previous iterations, it can process examples on the fly in a deployed system. @bottou2010large

=== Adaptive Moment Estimation
//https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Adam