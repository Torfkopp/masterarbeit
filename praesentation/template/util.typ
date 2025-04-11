
#let title-color = blue.darken(60%)

#let site-regex = "[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)"
#let https-site-regex = "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)"

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
