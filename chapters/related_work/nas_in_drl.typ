Using reinforcement learning for neural architecture search has been done for a long time
and thus has been heavily researched @white2023neural.
The other way around -- using neural architecture search to improve reinforcement learning --
is, however, not common. 
One of the works with this premise is @fu2020auto, introduces a framework that optimises
their DRL agent through NAS. The authors argue that their framework outperforms
manually designed DRL in both test scores and effiecency, potentially opening up new possibilities for automated and fast development of DRL-powered solutions for real-world applications.
Another paper that uses NAS to improve DRL is @mazyavkina2021optimizing.
In which the authors -- similar to the other paper -- report that modern NAS methods successfully find architectures for RL agents that outperform manually selected ones and that this suggests that automated architecture search can be effectively applied to RL problems, potentially leading to improved performance and efficiency in various RL tasks.