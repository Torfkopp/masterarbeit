//#import "@preview/diatypst:0.5.0": *
#import "template/lib.typ": *
#import "template/util.typ": *

#set document(
  title: "Optimisation of Reinforcement Learning using Evolutionary Algorithms",
  author: "Mario Fokken",
  date: datetime(day:24, month:4, year:2025),
)

#set text(region: "GB", font: "Ubuntu", size: 11pt)
// #show text.where(weight: "bold"): it => {
//   set text(font: "Libertinus Serif")
//   smallcaps(it)
// }

#show sym.arrow.r.filled: set text(fill: title-color)
#show figure.caption: it => {
  set text(size: 8pt)
  it
}

#show: slides.with(
  title: "Optimisation of Reinforcement Learning using Evolutionary Algorithms", // Required
  subtitle: "Master Thesis",
  date: "24.04.2025",
  authors: ("Mario Fokken"),
  university: "Carl von Ossietzky University of Oldenburg",

  // Optional Styling (for more / explanation see in the typst universe)
  ratio: 16/9,
  layout: "small",
  title-color: title-color,
  toc: true,
  count: "number",
  theme: "normal",

  // footer-title: "Optimisation of RL using EA",
)

#include "sections/introduction.typ"
#include "sections/basics.typ"
#include "sections/stack.typ"
#include "sections/concept.typ"
#include "sections/experiment.typ"
#include "sections/conclusion.typ"

== Bibliography
#bibliography("/refs.bib")
#pagebreak()

== Image Sources
#context{
  let figures = query(figure)
  for f in figures{
    if not (repr(f.caption).contains(regex(https-site-regex))) {continue}
    if not f.has("label") {continue}
    ref(f.label) + ": " + link(repr(f.caption).find(regex(site-regex)))
    linebreak()
  } 
}

#include "sections/summary.typ"
