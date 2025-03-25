== Machine Learning <machine_learning>

As shown in @ai_venn, Machine learning (ML) is a subset of artificial intelligence (AI) and it focuses on developing algorithms and statistical models that enable computers to perform tasks without explicit instructions. Instead, these systems learn from data by identifying patterns, making decisions, and improving over time through experience. This capability to learn and adapt autonomously has made machine learning a pivotal technology in various fields, from healthcare and finance to transportation and entertainment.

Machine learning is broadly defined as the study of computer algorithms that improve automatically through experience. Tom M. Mitchell, a prominent figure in the field, provides a more formal definition: "A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P if its performance at tasks in T, as measured by P, improves with experience E" (Mitchell, 1997). This definition highlights three key elements: the task (T), the experience (E), and the performance measure (P). @mitchell1997machine

Machine learning encompasses several types of learning paradigms, each suited to different types of problems and data: @goodfellow2016deep

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Supervised Learning]
In supervised learning, the algorithm is trained on a labeled dataset, which means that each training example is paired with an output label. The goal is to learn a mapping from inputs to outputs that can be used to predict the labels of new, unseen data. Common supervised learning algorithms include linear regression, decision trees, and neural networks.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Unsupervised Learning]
Unsupervised learning deals with unlabeled data. The algorithm's goal is to identify underlying patterns or structures in the data without any specific guidance. Techniques such as clustering (e.g. k-means) and dimensionality reduction (e.g. principal component analysis) are typical examples of unsupervised learning.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Semi-supervised Learning]
This approach combines both labeled and unlabeled data to improve learning accuracy. It is particularly useful when labeling data is expensive or time-consuming.

#heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Reinforcement Learning]
In reinforcement learning, an agent interacts with an environment and learns to make decisions by receiving rewards or penalties. The agent's objective is to maximise cumulative rewards over time. This paradigm is often applied in robotics, game playing, and autonomous systems.
\
\
Machine learning's ability to analyse vast amounts of data and extract meaningful insights has revolutionised many industries. In healthcare, ML algorithms can predict disease outbreaks, diagnose medical conditions from imaging data, and personalise treatment plans. In finance, they are used for credit scoring, fraud detection, and algorithmic trading. Autonomous vehicles rely on machine learning for navigation, obstacle detection, and decision-making. Additionally, ML powers recommendation systems for online shopping and content streaming platforms, enhancing user experiences by suggesting products and media based on individual preferences. @mitchell1997machine

=== Independent and identically distributed random variables
The independent and identically distributed (iid) assumption is a fundamental concept in statistics and machine learning. 
It means that given a set of data ${x_i}$, each of these $x_i$ observations is an independent draw from a fixed probabilistic model.
Independent means that the probability of observing two values $x_1$ and $x_2$ is the product of the probabilities of observing each value separately. @clauset2011brief
This assumption simplifies the analysis of data and allows for the application of various statistical methods. In machine learning, the iid assumption is often used in the context of training and testing datasets. When the data points are drawn independently from the same distribution, the iid assumption ensures that the model's performance on the training set generalises well to unseen data.

=== Stochastic Gradient Descent <stochastic_gradient_descent>

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

=== Adaptive Moment Estimation <adam>
//https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Adam
Adaptive Moment Estimation (Adam) is an optimisation algorithm that combines the benefits of two other popular optimisation algorithms: 
AdaGrad (adaptive gradient algorithm) @duchi2011adaptive, and RMSProp (Root Mean Square Propagation) @tieleman2012lecture,
both of which improve upon the SGD with a per-parameter learning rate.

Adam computes adaptive learning rates for each parameter, as well, by storing exponentially decaying averages of past squared gradients and past gradients. This allows Adam to adapt the learning rate during training, making it well-suited for a wide range of machine learning tasks. The algorithm is known for its robustness, efficiency, and ease of use, and it has become a popular choice for training deep neural networks. \
In every timestep $t$, Adam's parameter update is calculated as follows:

$ & m_t <- beta_1 dot m_(t-1) + (1 - beta_1) dot (nabla_theta f_t (theta_(t-1))) \ 
& v_t <- beta_2 dot v_(t-1) + (1 - beta_2) dot (nabla_theta f_t (theta_(t-1)))^2 \ 
& alpha_t = alpha dot sqrt(1- beta_2^t)/(1- beta_1^t) \
& theta_t <- theta_(t-1) - alpha_t dot m_t / (sqrt(v_t) + accent(epsilon.alt, hat)) $

$f(theta)$ is a noisy objective function that is differentiable
and whose expected value $EE[f(theta)]$ is to be minimised w.r.t. its parameters $theta$.
The algorithm updates exponential moving averages of the gradient $m_t$ and the squared gradient $v_t$,
which are estimates of the first moment (the mean) and the second moment (the uncentered variance) of the gradients, respectively.
The two hyperparameters $beta_1 , beta_2 in [0,1)$ control the exponential decay rates of these moving averages.
$epsilon.alt$ is a small scalar (e.g. $10^(-8)$) to prevent division by zero.

An important property of Adam's update rule is its careful choice of step sizes. 
It establishes a 'trust region' around the current parameter value, 
in order to prevent the algorithm from taking large steps in regions
where the current gradient estimate does not provide sufficient information.

Adam's initialisation bias correction is another key feature.
The algorithm corrects the bias of the first and second moment estimates
by dividing them by $1 - beta_1^t$ and $1 - beta_2^t$, respectively.
This ensures that the estimates are unbiased during the initial timesteps of training.
@kingma2014adam

Due to its robustness and efficiency, Adam has become a popular choice for training deep neural networks 
and is widely used in various machine learning applications. 
This popularity inspired the development of several variants and enhancements,
like AdaMax @kingma2014adam, AdamW @loshchilov2017decoupled, and AdamX @tran2019convergence,
but the original Adam algorithm is still used in popular sets of reinforcement learning algorithm implementations
like Stable-Baselines3 #footnote("https://stable-baselines3.readthedocs.io/en/master/") or cleanRL #footnote("https://cleanrl.dev/").
