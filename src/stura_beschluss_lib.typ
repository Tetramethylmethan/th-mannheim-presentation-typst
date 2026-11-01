
// ============================================
// TH Mannheim Brand Colors
// ============================================

#let colors = (
  blue: rgb(0,0,255),
)

#let text-color = black


// ============================================
// Theme Setup
// ============================================

#let setup(
  beschluss_nr: none,
  beschluss_text: none,
  president: none,
  vice_president: none,
  unterzeichner: none,
  protocol: none,
  date: none,
  body,
) = [
  #set text(font: "Liberation Sans")
  #set page(margin: (x: 3em, top: 3em, bottom: 13em))
  

    #grid(
      columns: (3fr, 1fr),
      rows: (3cm, auto),

      // Logo  
      align(left)[
          #image("../img/logo_studierendenschaft_mannheim-studierendenrat.png", height: 35pt)
        ], 

      // Beschluss Kästchen
      align(left)[
        #context{
          place(top + left)[
            #box(
              width: 100%,
              inset: (x: 5pt, y: 5pt),
              outset: (y: 3pt),
            stroke: black,
          )[
            Beschluss Nr. 

            #context{
              beschluss_nr
            }

          ]
          ]
        }
      ],
    
      // Beschluss
      place(dy: 6em)[
      #align(center)[
        Der Studierendenrat der Hochschule Mannheim hat in seiner Sitzung am
        *#context{date}* folgenden *Beschluss* gefasst:
          \ \ \

        #context{
          align(center)[
          #context{beschluss_text}

          ]
        }

      \ \
      Gezeichnet im Namen der Verfassten Studierendenschaft der Technischen Hochschule Mannheim:           
     
      \ \
        #context{
          unterzeichner
          [, Präsidium, ]
          date 
          [, ]
          [Mannheim]
          } 
      ],
      ],
      align(left)[
        #context{
          place(top + left)[
            #box(
              width: 100%,
              height: 100%,
              inset: (x: 5pt, y: 5pt),
              outset: (y: 3pt),
            stroke: black,
          )[
              *Präsidium des Studierendenrates:*

            #context{president}

            #context{vice_president}

            #context{protocol}


              

            #align(bottom+left)[
            *Studierendenrat der
            Technischen Hochschule
            Mannheim*

            Paul-Wittsack-Str. 10
            68163 Mannheim
            stura\@hs-mannheim.de
          ]
          ]
          
          ]
        }
      ]
    )


]

}