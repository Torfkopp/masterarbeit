
#let title-color = blue.darken(60%)

#let highlight(it) = {
  set text(fill: title-color)
  set text(weight: "bold")
  it
}

#let image-link(it) = {
  link(it)[\*]//#context counter(figure).display("a")]]
}

#let source(it) = {
  set align(bottom+right)
  it
}