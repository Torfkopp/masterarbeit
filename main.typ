#set text(region: "GB")
#set heading(numbering: "1.")

#show "ÜBERARBEITEN": set text(fill: red, size: 40pt)

#include "chapters/abstract.typ"

SAC NAS

#text(size: 8pt)[Title page and styling under construction]

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