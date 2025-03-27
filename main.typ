#set page(paper: "a4")
//#set page(margin: (left:3cm, right: 3cm, top: 3cm, bottom:3cm))
#set page(margin: (inside: 4cm, outside: 3cm, top: 3cm, bottom: 3cm))
#set par(leading: 0.65em * 1.5, spacing: 1.5em, justify: true)
#set text(region: "GB", font: "Ubuntu", size: 11pt)
#set heading(numbering: "1.")

#show heading: it => {
  set text(font: "Libertinus Serif")
  set block(below: 1em, above: 2em)
  smallcaps(it)
}
#show heading.where(level: 1): it => { colbreak(weak: true); it}

#include "template/titlepage.typ"

#place(center)[
  #heading(numbering: none, outlined: false)[Abstract]\
  #include "template/abstract.typ"
]

#pagebreak()

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(indent: auto)

#{
  set footnote.entry(separator: none)
  show footnote.entry: hide
  show ref: none
  show footnote: none
  
  pagebreak()
  outline(
    title: [List of figures], target: figure,
  )
}
#pagebreak()

#counter(page).update(1)
#counter(footnote).update(0)
#set page(numbering: "1")

#include "chapters/introduction.typ"
#include "chapters/basics/basics.typ"

#include "chapters/stack/stack.typ"
#include "chapters/concept.typ"
#include "chapters/implementation.typ"
#include "chapters/experiment.typ"

#include "chapters/results.typ"
#include "chapters/evaluation.typ"
#include "chapters/conclusion.typ"



#pagebreak()
#bibliography("refs.bib")

#pagebreak()
#include "chapters/appendix.typ"

#include "template/erklaerung.typ"