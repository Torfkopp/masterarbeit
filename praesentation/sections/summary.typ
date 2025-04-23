#import "../template/util.typ": *
== Summary

#stack(
    dir: ltr,
    block(width: 80%)[
        - Hypothesis: a NAS algorithm can perform better than manually picked architectures in a reasonable time in the ARL architecture
        
        - Three NAS algorithms were tested:
            - NEAT (Evolutionary Algorithm)
            - An reinforcement learning approach ("Minimal-NAS")
            - Bayesian optimisation
    ],
    h(2em),
    block()[
        #show figure.caption: it => text(fill: black.opacify(-100%))[#it]
        #figure(
            image("../figures/fired.png", width: 15%),
            gap: -1em,
            caption: [Fired! #image-link("https://ih1.redbubble.net/image.4720339522.3301/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg")],
        ) <fired>
    ]
)


#stack(
    dir: ltr,
    block(width: 60%)[
        - 1#super[st] exp. showed BO performing better, but may not be meaningful since no agent learnt
        - 2#super[nd] exp. showed no NAS method performing, with Baseline only one learning
  
        #sym.arrow.r.filled Hypothesis could not be proven, further research needed
    ],
    h(-2em),
    block(width: 50%)[
        #show figure.caption: it => text(fill: black.opacify(-100%))[#it]
        #figure(
            image("../figures/giphy.gif", width: 60%),
            gap: -1em,
            caption: [Drawing Board #image-link("https://giphy.com/gifs/spongebob-season-3-spongebob-squarepants-xTeV7ycHGuPnKX92cE")],
        ) <spongebob>
    ]
)
