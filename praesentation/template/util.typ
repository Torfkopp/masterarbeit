
#let title-color = blue.darken(60%)

#let site-regex = "[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)"
#let https-site-regex = "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)"

#let last-slide-counter = counter("last-slide")
#let first-slide-counter = counter("first-slide")

#let update-last-slide-counter() = {
  context last-slide-counter.update(counter(page).get().first())
}

#let highlight(it) = {
  set text(fill: title-color)
  set text(weight: "bold")
  it
}

#let image-link(it) = {
  link(it)[\*]//#context counter(figure).display("a")]]
}

#let source(it) = {
  v(1fr)
  set align(bottom+right)
  it
}
