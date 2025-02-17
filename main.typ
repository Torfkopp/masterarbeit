#set page(paper: "a4", margin: (left:3cm, right: 3cm, top: 3cm, bottom:3cm))
#set par(leading: 0.65em * 1.5, spacing: 1.5em, justify: true)
#set text(region: "GB", font: "DejaVu Serif", size: 11pt)
#set heading(numbering: "1.")

#show "ÜBERARBEITEN": set text(fill: red, size: 40pt)
#show heading: it => {
  set text(font: "DejaVu Sans")
  set block(below: 1em, above: 2em)
  it
}

#include "template/titlepage.typ"

#include "template/abstract.typ"

#pagebreak()

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(indent: auto)
#pagebreak()

#outline(title: [List of figures], target: figure)
#pagebreak()

#counter(page).update(1)
#set page(numbering: "1")

#include "chapters/introduction.typ"
#include "chapters/background.typ"
#include "chapters/related_work.typ"
#include "chapters/stack.typ"

#include "chapters/concept.typ"
#include "chapters/implementation.typ"
#include "chapters/experiment.typ"
#include "chapters/evaluation.typ"
#include "chapters/conclusion.typ"

#pagebreak()
#include "chapters/figures.typ"

#pagebreak()
#bibliography("refs.bib")

#include "template/erklaerung.typ"