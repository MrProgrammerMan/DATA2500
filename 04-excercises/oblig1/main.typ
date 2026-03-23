#set page(paper: "a4", margin: 2.5cm)
#set text(size: 11pt)
#set text(lang: "nb")
#show link: it => text(fill: rgb("#004183"))[#it]
#show raw: it => highlight(fill: rgb("#dfdfdf"))[#it]
#show ref: it => highlight(fill: rgb("#dfdfdf"))[#it]

#align(center)[
  #text(1.6em, weight: "bold")[DATA2500 Obligatorisk oppgave]
  #v(1.8em)
  #link("https://github.com/MrProgrammerMan")[Jonas Hazeland Baugerud] (#link("mailto:jobau8311@oslomet.no")[jobau8311\@oslomet.no])
  #v(1.2em)
  Rapporten er skrevet i #link("https://typst.app/")[typst] og bygget med #link("https://github.com/loqusion/typix")[typix].
  #v(0.6em)
  Sist endret: #datetime.today().display("[day].[month].[year]")
]

#pagebreak()
= 1. Innhold
Denne rapporten inneholder løsninger på alle oppgavene i `DATA2500 Operativsystemer`. De er organisert etter `[ukenummer].[oppgavenummer]`.

Løsningene er mine egne.

#outline()
#pagebreak()

#let weeks = (3, 4, 5, 6, 7, 9, 10)

#for (index, week) in weeks.enumerate() {
  include("tasks/week" + str(week) + ".typ")
  if index < weeks.len() - 1 {
    pagebreak()
  }
}
