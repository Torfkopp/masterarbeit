== Bayesian Optimisation

Bayesian optimisation (BO) is a framework designed to efficiently locate the global maximiser of an unknown function $f(x)$ -- also known as black-box function -- within a defined design space $X$. This methodology is particularly advantageous in scenarios where function evaluations are expensive or time-consuming, such as hyperparameter tuning in machine learning or experimental design in scientific research.

The optimisation process unfolds sequentially. At each step, BO selects a query point from the design space, observes the (potentially noisy) output of the target function at that point, and updates a probabilistic model representing the underlying function. This iterative approach refines the model and guides subsequent search decisions, progressively improving the efficiency of finding the global optimum.

The key components of Bayesian optimisation include the probabilistic surrogate model, the acquisition function, and sequential updating.
The probabilistic surrogate model is central to BO and provides a computationally cheap approximation of the target function. The surrogate starts with a prior distribution that encapsulates initial beliefs about the function's behaviour. This prior is updated based on observed data using Bayesian inference to yield a posterior distribution, which becomes increasingly informative as more evaluations are performed. \
The Acquisition function directs the exploration of the design space by quantifying the utility of candidate points for the next evaluation. It balances exploration (sampling regions with high uncertainty) and exploitation (refining areas likely to yield high values). Popular acquisition functions include Thompson sampling, probability of improvement, expected improvement, and upper confidence bounds, each offering a unique strategy to navigate the trade-off between discovering new regions and capitalising on known promising areas.
Lastly, sequential ensures that after observing the function value at a new query point, the surrogate model is updated to incorporate this information. The prior distribution is adjusted to produce a posterior that better reflects the function's behaviour, enhancing the precision of subsequent predictions.

#import "@preview/algo:0.3.6": algo, i, d, comment, code
#figure(
  algo(
    header: [
      #set text(font: "Libertinus Serif", weight: "bold")
      #smallcaps("Bayesian Optimisation")\ 
      #v(-1.5em) #repeat("_")
    ],
    main-text-styles: (size: 10pt),
    comment-styles: (size: 10pt),
    line-numbers: false,
    indent-size: 20pt,
    keywords: ("for", "do", "end"),// "select", "query", "augment", "update"),
    inset: 5pt,
    column-gutter: 10pt
  )[
    for $n = 1, 2, ...$ do#i\
      select new $x_(n+1)$ by optimising acquisition function $alpha$: #i\
      $ x_(n+1) = arg max_x alpha (x; cal(D)_n) $ #d\
      query objective function to obtain $y_(n+1) = f(x_(x+1))$ \
      augment data set $cal(D)_n = {cal(D)_n, (x_(n+1), y_(n+1))}$ \
      update statistical model #d\
    end for 
  ],
  caption: [Pseudocode for Bayesian optimisation @shahriari2015taking]
)

These aspects of Bayesian optimisation lead to several advantages:
Firstly, BO is data-efficient, requiring fewer evaluations to identify the global optimum compared to traditional optimisation methods. This makes it particularly suitable for scenarios where function evaluations are costly or time-consuming.
Secondly, Bayesian optimisation is well-suited for optimising black-box functions, where the underlying function is unknown or lacks a closed-form expression. This flexibility allows BO to handle a wide range of optimisation problems without requiring derivative information.
Moreover, Bayesian optimisation is effective for optimising non-convex and multimodal functions, where the objective landscape is complex and contains multiple local optima. The probabilistic nature of the surrogate model enables BO to explore diverse regions of the design space, increasing the likelihood of finding the global maximiser.
Lastly, Bayesian optimisation leverages the full optimisation history to make informed search decisions. By iteratively updating the surrogate model and acquisition function, BO incorporates past evaluations to guide the search towards promising regions, enhancing the efficiency of the optimisation process. @shahriari2015taking
