#set page(paper: "a4", margin: 2.5cm)
#set text(size: 11pt)

#align(center)[
  #text(1.6em, weight: "bold")[DATA2500 Obligatorisk oppgave 1]
  #v(0.6em)
  Jonas Hazeland Baugerud (jobau8311) & Bjørnar Reime (bjrei3390)
  #v(0.6em)
  #datetime.today().display()
]

#pagebreak()
= 1. Innhold
#outline()
#pagebreak()

#let weeks = (3, 4, 5, 6, 7, 9, 10)

#for (index, week) in weeks.enumerate() {
  include("tasks/week" + str(week) + ".typ")
  if index < weeks.len() - 1 {
    pagebreak()
  }
}
