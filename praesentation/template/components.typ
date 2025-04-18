#import "util.typ"

#let progress-bar(height: 2pt, primary, secondary) = {
  context {
    //let last = counter(page).final().first()
    let last = util.last-slide-counter.final().first()
    // let current = here().page()
    let current = counter(page).get().first()
    let ratio = calc.min(1.0, current / last)
    
    grid(
      columns: (ratio * 100%, 1fr),
      rows: height,
      gutter: 0pt,
      grid.cell(fill: primary)[], grid.cell(fill: secondary)[],
    )
  }
}

#let short-heading-func(self: none, it) = {
  if it == none {
    return
  }
  let convert-label-to-short-heading = if (
    type(self) == dictionary and "methods" in self and "convert-label-to-short-heading" in self.methods
  ) {
    self.methods.convert-label-to-short-heading
  } else {
    (self: none, lbl) => titlecase(lbl.replace(regex("^[^:]*:"), "").replace("_", " ").replace("-", " "))
  }
  convert-label-to-short-heading = convert-label-to-short-heading.with(self: self)
  assert(type(it) == content and it.func() == heading, message: "it must be a heading")
  if not it.has("label") {
    return it.body
  }
  let lbl = str(it.label)
  return convert-label-to-short-heading(lbl)
}

#let simple-navigation(
  self: none,
  short-heading: true,
  primary: white,
  secondary: gray,
  background: black,
  logo: none,
) = (
  context {
    let body() = {
      let sections = query(heading.where(level: 1))
      if sections.len() == 0 {
        return
      }
      let current-page = here().page()
      set text(size: 0.5em, weight: "bold")
      for (section, next-section) in sections.zip(sections.slice(1) + (none,)) {
        set text(fill: if section.location().page() <= current-page and (
          next-section == none or current-page < next-section.location().page()
        ) {
          primary
        } else {
          secondary
        })
        box(inset: 0.5em)[#link(
            section.location(),
            if short-heading {
              short-heading-func(self: self, section)
            } else {
              section.body
            },
          )<touying-link>]
      }
    }
    block(
      fill: background,
      inset: 0pt,
      outset: 0pt,
      grid(
        align: center + horizon,
        columns: (1fr, auto),
        rows: 1.8em,
        gutter: 0em,
        grid.cell(
          fill: background,
          body(),
        ),
        block(fill: background, inset: 4pt, height: 100%, text(fill: primary, logo)),
      ),
    )
  }
)
