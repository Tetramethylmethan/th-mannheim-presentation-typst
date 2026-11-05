#import "@preview/polylux:0.4.0": *
#import "../src/slides_lib.typ" as hm: *

// Set theme and metatdata
#show: hm.setup.with(
  title: "Studierendenratssitzung 10.10.23",
  subtitle: "Typst für den Drecksladen",
  author: "Falko Piwinger",
  institute: "Technische Hochschule Mannheim",
  date: datetime.today().display(),
  font: "Nimbus Sans",
  show-footer: false,
  show-footer-num-pages: true,
  color-primary: hm.thma-colors.red,
  color-accent: hm.thma-colors.red,

)

// Create title slide
// Content is retrived from metadata
#title-slide()

// Change the Prefix of the TOC 
#table-of-contents(prefix:"TOP ")

// Change Numbering of the Headings
// 1 for numbers, A for Letters "," and "." can also be used
#show heading.where(): set heading(numbering:"1")

#slide[
  = Motivation
  - Typst is great
  - Polylux for creating presentations
  - TH Mannheim theme, because logos and colors are nice

  #linebreak()
  - This slide is using the standard `#slide` command
]

#slide[
  #heading(level: 1)[Project Status]
  - Early stages
    - Title page and footer with TH Mannheim logos
      - Custom layouts and section slides
]


#slide-vertical("Content vertical aligned")[
  - Content is centered vertically
]

#slide-centered("Content is centered", show-footer: false)[
  #text(size: 24pt)[Make a nice statement]

  #context {
    text(fill: text.fill.lighten(50%))[The predefined layouts have the argument
      `hide-footer` to not show the footer on specific slides.]
  }
]

#slide-split-2(
  "Split page into to columns",
  [
    - Default content starts at the top
  ],
  align(horizon)[- can use `align` to center it],
)

#slide-split-1-2(
  "Uneven split",
  [
    - Some short statements
    - Typst is powerful
  ],
  [
    - Here we need more space for longer explanations
    - When creating documents with Typst, the content is much more in focus
      compared to LaTeX.
  ],
)

#title-slide(
  title: "Title slide with overwritten values",
  subtitle: "Adding the BMFTR logo",
  uppercase-title: false,
  author: none,
  institute: none,
  date: none,
)