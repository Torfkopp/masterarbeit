== Bayesian Optimisation

Bayesian Optimization (BO) is a framework designed to efficiently locate the global maximizer of an unknown function $f(x)$ -- also known as black-box function -- within a defined design space $X$. This methodology is particularly advantageous in scenarios where function evaluations are expensive or time-consuming, such as hyperparameter tuning in machine learning or experimental design in scientific research.

The optimization process unfolds sequentially. At each step, BO selects a query point from the design space, observes the (potentially noisy) output of the target function at that point, and updates a probabilistic model representing the underlying function. This iterative approach refines the model and guides subsequent search decisions, progressively improving the efficiency of finding the global optimum.

The key components of Bayesian Optimization include are the probabilistic surrogate model, the acquisition function, and sequential updating.
The probabilistic surrogate model is central to BO and provides a computationally cheap approximation of the target function. The surrogate starts with a prior distribution that encapsulates initial beliefs about the function's behavior. This prior is updated based on observed data using Bayesian inference to yield a posterior distribution, which becomes increasingly informative as more evaluations are performed. \
The Acquisition function directs the exploration of the design space by quantifying the utility of candidate points for the next evaluation. It balances exploration (sampling regions with high uncertainty) and exploitation (refining areas likely to yield high values). Popular acquisition functions include Thompson sampling, probability of improvement, expected improvement, and upper confidence bounds, each offering a unique strategy to navigate the trade-off between discovering new regions and capitalizing on known promising areas.
Lastly, sequential ensures that after observing the function value at a new query point, the surrogate model is updated to incorporate this information. The prior distribution is adjusted to produce a posterior that better reflects the function's behavior, enhancing the precision of subsequent predictions.

These aspects of Bayesian optimisation lead to several advantages:
Firstly, BO is data-efficient, requiring fewer evaluations to identify the global optimum compared to traditional optimization methods. This makes it particularly suitable for scenarios where function evaluations are costly or time-consuming.
Secondly, Bayesian Optimization is well-suited for optimizing black-box functions, where the underlying function is unknown or lacks a closed-form expression. This flexibility allows BO to handle a wide range of optimization problems without requiring derivative information.
Moreover, Bayesian Optimization is effective for optimizing non-convex and multimodal functions, where the objective landscape is complex and contains multiple local optima. The probabilistic nature of the surrogate model enables BO to explore diverse regions of the design space, increasing the likelihood of finding the global maximizer.
Lastly, Bayesian Optimization leverages the full optimization history to make informed search decisions. By iteratively updating the surrogate model and acquisition function, BO incorporates past evaluations to guide the search towards promising regions, enhancing the efficiency of the optimization process. @shahriari2015taking


// The key aspects of Bayesian optimisation are:
// - Objective: Find the global maximizer of an unknown function f(x) over a design space X
// - Sequential process: It iteratively selects query points, observes noisy outputs, and updates a probabilistic model
// - Probabilistic surrogate model: Uses a prior distribution to capture beliefs about the objective function's behavior
// - Acquisition function: Guides the exploration-exploitation trade-off when selecting new query points

// Components of Bayesian Optimization
// - Probabilistic surrogate model:
//   - Prior distribution representing beliefs about the objective function
//   - Observation model describing the data generation mechanism
// - Acquisition function:
//   - Evaluates the utility of candidate points for the next evaluation
//   - Examples include Thompson sampling, probability of improvement, expected improvement, and upper confidence bounds
// - Sequential updating:
//   - After each query, the prior is updated to produce a more informative posterior distribution

// Advantages
// - Data-efficient: Suitable for optimizing functions with costly evaluations
// - Handles black-box functions: No need for derivative information
// - Effective for nonconvex and multimodal functions
// - Leverages full optimization history to make efficient searches
