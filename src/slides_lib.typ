// Presentation theme for Technische Hochschule Mannheim
#import "@preview/polylux:0.4.0": *

// ============================================
// TH Mannheim Brand Colors
// ============================================

#let thma-colors = (
  red: rgb(252, 85, 85),
  green: rgb(74, 211, 134),
  yellow: rgb(255, 255, 0),
  blue: rgb(0,0,255),
  dark-gray: rgb(110, 110, 110),
  light-gray: rgb(198, 198, 198),
  accent1: rgb(87, 66, 63),
  accent2: rgb(191, 165, 163),
  accent3: rgb(110, 158, 0),
  accent4: rgb(55, 106, 0),
)

#let text-color = black

// Metadata for access across slides
#let meta-state = state("meta", (:))


// ============================================
// Footer
// ============================================

#let thma-footer() = {
  set text(size: 10pt)
  context {
    let m = meta-state.get()
    grid(
      columns: (1fr, 6fr, 1fr),

      align(left)[
        #image("../img/TH_Mannheim_Logo_RGB_blau.svg", height: 22pt)
      ],
      [#text(weight: "bold")[#m.title #if m.subtitle != none {
            [\- #m.subtitle]
          }] #linebreak()
        #m.author #if m.institute != none {
          [\- #m.institute]
        }],
      align(right)[
        #toolbox.slide-number#if m.show-footer-num-pages == true {
          [/#toolbox.last-slide-number]
        }],
    )
  }
}

// ============================================
// thma-header
// ============================================

#let thma-header() ={
  context{
    let m = meta-state.get()
    grid(
      columns: (1fr, 1fr),

      align(left)[
        #toolbox.slide-number#if m.show-footer-num-pages == true {
          [/#toolbox.last-slide-number]
        }],
      align(right)[
        #image("../img/TH_Mannheim_Logo_RGB_blau.svg", height: 40pt)
      ],
    )
  }

}

#let table-of-contents(title: "Inhalt", prefix: "hier nicht") = [
  #let concPrefix(prefix, it) = {
      [#prefix #it.prefix()] 
  }
  #show outline.entry.where(level: 1): it => {
    set text(fill: thma-colors.blue, size: 1em)
    link(
      it.element.location(),
      it.indented(
        concPrefix(prefix, it),
        it.body()
      )
    )
  }
  
  #outline(
    title: title,
    target: heading.where(level: 1)
  )
]

// ============================================
// Title slide
// ============================================

#let title-slide(
  title: [],
  subtitle: [],
  author: [],
  institute: [],
  date: [],
  uppercase-title: true,
  show-footer: false,
  content-overlay: none,
) = slide[
  #set align(center + horizon)
  #set text(fill: white)
  #set page(footer: if show-footer { thma-footer() })
  #set page(fill: thma-colors.blue)
  
  #context {
    let m = meta-state.get()

    place(top + left)[
      #image("../img/TH_Mannheim_Logo_RGB_wei├ƒ.svg", height: 3cm)
    ]

    place(left + horizon, dx: 2%, dy: 40%, {
      let override-or-meta(value, meta-value) = if value == [] {
        meta-value
      } else { value }

      box(width: 75%, {
        // Title
        text(size: 22pt, weight: "bold", fill: white)[
          #if uppercase-title { upper(override-or-meta(title, m.title)) } else {
            override-or-meta(title, m.title)
          }
        ]

        v(0.5em)
        // Subtitle
        text(
          size: 18pt,
          fill: white,
          style: "italic",
          weight: "light",
        )[
          #override-or-meta(subtitle, m.subtitle)
          #linebreak()
        ]


        // Author
        text(
          size: 16pt,
          weight: "light",
          fill: white,
        )[
          #linebreak()
          #override-or-meta(author, m.author)]

        text(size: 16pt, weight: "light")[
          #linebreak()
          #override-or-meta(institute, m.institute)]

        // Date
        text(size: 14pt, weight: "light")[
          #linebreak()
          #override-or-meta(date, m.date)]
      })
    })
  }
  #if content-overlay != none {
    content-overlay
  }
]

// ============================================
// Theme Setup
// ============================================

#let setup(
  aspect-ratio: "4-3",
  title: none,
  subtitle: none,
  author: none,
  institute: none,
  date: none,
  show-footer: true,
  show-header: true,
  show-footer-num-pages: true,
  color-primary: thma-colors.red,
  color-accent: thma-colors.red,
  font: ("Helvetica Neue", "Nimbus Sans"),
  size-base: 16pt,
  numbering: "1",
  body,
) = {
  // Store metadata in state
  meta-state.update((
    title: title,
    subtitle: subtitle,
    author: author,
    institute: institute,
    date: date,
    show-footer: show-footer,
    show-footer-num-pages: show-footer-num-pages,
    color-primary: color-primary,
    color-accent: color-accent,
  ))

  set text(
    font: font,
    weight: "light",
    size: size-base,
    fill: text-color,
  )

  // Page setup
  set page(
    paper: "presentation-" + aspect-ratio,
    fill: white,
    margin: (x: 3em, top: 3em, bottom: 4em),
    footer: if show-footer { thma-footer() },
    background: place(top+ right,dx: -3%,dy: 3%,  image("../img/TH_Mannheim_Logo_RGB_blau.svg", height: 50pt))

  )

  // Heading styles
  show heading.where(level: 1): set text(
    size: 28pt,
    fill: thma-colors.blue,
    weight: "bold",
  )


  show heading.where(level: 2): set text(
    size: 22pt,
    fill: thma-colors.dark-gray,
    weight: "bold",
  )

  // List styling
  set list(
    marker: (
      text(fill: color-accent, [▶]),
      text(fill: color-accent.darken(20%), [▶]),
      text(fill: color-accent.darken(40%), [▶]),
      text(fill: color-accent.darken(50%), [▶]),
      text(fill: color-accent.darken(60%), [▶]),
    ),
    indent: 0.25em,
  )
  set enum(indent: 1em)

  body
}

// ============================================
// Slide Layouts
// ============================================

#let slide-vertical(
  title,
  body,
  show-footer: true,
  show-header: true,
  content-overlay: none,
) = slide[
  #set page(footer: if show-footer { thma-footer() })
  #heading[#title]
  #align(horizon)[
    #body
  ]
  #if content-overlay != none {
    content-overlay
  }
]

#let slide-centered(
  title,
  body,
  show-footer: true,
  content-overlay: none,
) = slide[
  #set page(footer: if show-footer { thma-footer() })
  #heading[#title]
  #align(center + horizon)[
    #body
  ]
  #if content-overlay != none {
    content-overlay
  }
]

#let slide-split-2(
  title,
  content-left,
  content-right,
  show-footer: true,
  content-overlay: none,
) = slide[
  #set page(footer: if show-footer { thma-footer() })
  #heading[#title]
  #v(1em)
  #grid(
    columns: (1fr, 1fr),
    rows: 1fr,
    content-left, content-right,
  )
  #if content-overlay != none {
    content-overlay
  }
]

#let slide-split-1-2(
  title,
  content-left,
  content-right,
  bg-color: white,
  show-footer: true,
  content-overlay: none,
) = slide[
  #set page(
    background: place(left + top, box(
      width: 30%,
      height: 100%,
      fill: bg-color,
    )),
  )
  #set page(footer: if show-footer { thma-footer() })
  #heading[#title]
  #v(1em)
  #grid(
    columns: (1fr, 2fr),
    rows: 1fr,
    content-left, content-right,
  )
  #if content-overlay != none {
    content-overlay
  }
]

// ============================================
// Section Support
// ===========================================
// 
// TODO REMOVE ODER SO

#let page-progress = toolbox.progress-ratio(ratio => {
  set grid.cell(inset: (y: .05em))
  let m = meta-state.get()
  grid(
    columns: (ratio * 100%, 1fr),
    grid.cell(fill: m.color-primary)[],
    grid.cell(fill: m.color-primary.luma().lighten(50%))[],
  )
})

#let new-section(name, show-slide: true) = {
  toolbox.register-section(name)
  if show-slide == true {
    slide({
      set page(header: none, footer: none)
      show: pad.with(x: 10%, y: 25%)
      set text(size: 22pt, weight: "bold")
      name
      page-progress
    })
  }
}

#let new-section-orientation(name, highlight-color: none) = slide({
  set page(header: none, footer: none)
  show: pad.with(x: 10%, y: 5%)
  set text(size: 22pt)

  toolbox.register-section(name)

  toolbox.all-sections((sections, current) => {
    for section in sections {
      if section == current {
        text(
          weight: "bold",
          fill: if highlight-color != none { highlight-color } else {
            text.fill
          },
          top-edge: "ascender",
        )[#section]
      } else {
        text(weight: "light", fill: text.fill.lighten(50%))[#section]
      }
      linebreak()
    }
  })

  align(bottom)[
    #page-progress
  ]
})

#let toc = toolbox.all-sections((sections, _cur) => {
  list(..sections)
})

#let slide-toc(title: "Content") = slide[
  #set page(footer: none)
  #heading[#title]
  #text(size: 22pt, weight: "light")[
    #grid(
      columns: (1fr, 7fr, 2fr),
      rows: (5fr, 1fr),
      [], align(horizon, toc),
    )
  ]
]