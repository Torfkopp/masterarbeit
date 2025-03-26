= Results

The outputs of the two experiments were saved to a database
and visualised with Grafana #footnote("https://grafana.com/"), 
an open-source platform for monitoring, visualising, and analysing data from various sources
by allowing users to create interactive dashboards and graphs to track metrics, logs, and other data in real-time.

== 1#super[st] Experiment: Cigre

The experiment of the first scenario took 11 hours and 18 minutes to finish.

#figure(
    image("/images/results/cigre_agent_rewards.png", width: 100%),
    caption: [Rewards of the agents over time in the 1#super[st] experiment.]
) <cigre_rewards>


@cigre_rewards shows the rewards of the agents over time; the higher the rewards are, the better the agent is performing.
The four phases of the experiment with their corresponding active NAS method are marked:
the first phase was the NEAT phase, followed by RL, BO, and then the baseline.
Apparent is the phase of the BO method, whose rewards are peaking several times a cut above the other three's
highest rewards. The lows also tend to be higher than the other methods' lows.
The graphs of the other three methods are highly similar, with their highs and lows being around the same values.
Except for some time between 17:00 and 17:30, which resembles the other three methods' performance,
the BO method's performance looks to be better than the other three methods' performance.
All methods do not seem to learn as the rewards are not increasing over time.

#figure(
    table(
        columns: 4,
        align: (left, center, center, right),
        table.header(
            [*Method*], [*First Step*], [*Last Step*], [*Total Duration*]
        ),
        [NEAT], [10:33:52], [12:55:42], [2:21:50],
        [RL], [12:56:28], [15:07:48], [2:11:20],
        [BO], [15:08:41], [18:39:42], [3:31:01],
        [Base], [18:40:30], [21:52:44], [3:12:14],
    ),
    caption: [The duration of each phase in the 1#super[st] experiment.]
) <cigre_duration>

Another information extractable from the graph is each phases duration, which is shown in @cigre_duration.
It shows that NEAT was the fastest of the methods, followed by RL, the baseline, and BO.
The difference between RL's duration and BO's duration is 1:19:41, in other words, 
takes the BO agent around 60% longer than the RL agent.
Both RL and NEAT are faster than the baseline by 1 hour 54 seconds (around 32% faster) and 50:24 minutes (ca. 26%), respectively.
BO is slower than the baseline by 18:47 minutes (around 10% slower).

#figure(
    image("/images/results/cigre_sperm.png", width: 100%),
    caption: [Violin plots of each method's objective scores in the 1#super[st] experiment.]
) <cigre_violin>

The violin plots in @cigre_violin show the distribution of the objective scores -- or the agent rewards -- of each method
with the minimum, maximum, and median values of each method listed explicitly in the @cicre_objective below.

#figure(
    table(
        columns: 4,
        align: (left, center, center, center),
        table.header(
            [*Method*], [*Min*], [*Max*], [*Median*],
        ),
        [BO], [0.6244281], [0.770436], [0.7174087],
        [NEAT], [0.6193798], [0.7467596], [0.709123],
        [Base], [0.6199054], [0.7521687], [0.709123],
        [RL], [0.6193798], [0.7467596], [0.709123],
    ),
    caption: [The minimum, maximum, and median objective scores of each method in the 1#super[st] experiment.]
) <cicre_objective>

Both @cigre_violin and @cicre_objective reinforce what is seen in @cigre_rewards:
the BO method is a cut above the rest and has the highest median, maximum, and minimum objective scores,
whilst the other three methods all have similar values for these three metrics.

The hypothesis made at the beginning of this thesis is that
a NAS algorithm can improve upon the performance of a user-picked architecture in a reasonable amount of time.
In regards to this experiment, the hypothesis is true.
All three NAS methods have either similar performance as the baseline in less time (NEAT, RL)
or a better performance with a slightly higher, but still reasonable, time investment (BO).


== 2#super[nd] Experiment: Cigre + Cohdarl

Due to the increased amount of seconds to simulate for the second scenario, the experiment took 24 hours and 21 minutes to finish.

#figure(
    image("/images/results/cohdarl_agent_rewards.PNG", width: 100%),
    caption: [Rewards of the agents over time in the 2#super[nd] experiment.]
) <cohdarl_rewards>

In the graph of @cohdarl_rewards, the four phases of the experiment are marked with the active NAS method:
BO, RL, NEAT and lastly the baseline.
Contrary to the first experiment, BO as well as RL and NEAT perform way worse than the baseline.
BO's, RL's, and the baseline's rewards start at a similar level, but only the baseline's rewards increase over time -- meaning the agent learns.
Interestingly, the rewards of both NAS methods are getting worse with the BO agent's rewards slightly deteriorating over time
and the RL agent's rewards visibly plummeting slightly after the half-way mark of its phase.
The NEAT agent's rewards are the lowest of all four methods; they start at a lower level and do not increase visibly over time.

#figure(
    table(
        columns: 4,
        align: (left, center, center, right),
        table.header(
            [*Method*], [*First Step*], [*Last Step*], [*Total Duration*]
        ),
        [BO], [13:30:11], [23:27:42], [9:57:31],
        [RL], [23:29:07], [04:32:07], [5:03:00],
        [NEAT], [04:33:13], [06:47:43], [2:14:30],
        [Base], [06:48:34], [13:51:17], [7:02:43],
    ),
    caption: [The duration of each phase in the 2#super[nd] experiment.]
) <cohdarl_duration>

The durations of the phases in the 2#super[nd] experiment are shown in @cohdarl_duration.
NEAT was the fastest of the methods by a large margin, followed by RL and the baseline.
BO was the slowest of the methods, taking almost 3 hours longer than the baseline (40% longer).
Both RL and NEAT were faster than the baseline by 1 hours 59 minutes 43 seconds (around 30% faster) and 4 hours 48 minutes (around 68%), respectively.

#figure(
    image("/images/results/cohdarl_spear.PNG", width: 100%),
    caption: [Violin plots of each method's objective scores in the 2#super[nd] experiment.]
) <cohdarl_violin>

#figure(
    table(
        columns: 4,
        align: (left, center, center, center),
        table.header(
            [*Method*], [*Min*], [*Max*], [*Median*],
        ),
        [Base], [0.7482757], [4,025.185], [3.777617],
        [BO], [0.7066692], [3,292.298], [2.249176],
        [RL], [0.6156467], [3,264.563], [2.238741],
        [NEAT], [0.4796731], [2,211.526], [1.598038],
    ),
    caption: [The minimum, maximum, and median objective scores of each method in the 2#super[nd] experiment.]
) <cohdarl_objective>

The violin plots in @cohdarl_violin as well as the @cohdarl_objective clarify the results of the experiment:
the baseline wins by a landslide, with the highest median, maximum, and minimum objective scores.
NEAT loses by a large margin, with the poorest results in all three metrics.

The hypothesis of this work cannot be confirmed by the results of the second experiment.
The BO method neither improves upon the baseline's performance nor does it perform this task in a reasonable amount of time.
The RL and NEAT methods are faster than the baseline, but their performance is significantly worse.
All three NAS methods do not seem to be learning, as their rewards are not increasing over time.
