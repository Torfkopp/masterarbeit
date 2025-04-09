//#import "@preview/diatypst:0.5.0": *
#import "template/lib.typ": *

#show: slides.with(
  title: "Optimisation of Reinforcement Learning using Evolutionary Algorithms", // Required
  subtitle: "Master Thesis",
  date: "24.04.2025",
  authors: ("Mario Fokken"),
  university: "Carl von Ossietzky University of Oldenburg",

  // Optional Styling (for more / explanation see in the typst universe)
  ratio: 16/9,
  layout: "small",
  title-color: blue.darken(60%),
  toc: true,
  count: "number",
  theme: "normal",

  // footer-title: "Optimisation of RL using EA",
)

#include "sections/basics.typ"
#include "sections/stack.typ"
#include "sections/concept.typ"
#include "sections/implementation.typ"
#include "sections/experiment.typ"
#include "sections/conclusion.typ"

== Bibliography
#bibliography("/refs.bib")
