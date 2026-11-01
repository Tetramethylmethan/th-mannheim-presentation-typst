#import "../src/stura_beschluss_lib.typ" as lib: *

// Setup
#show: lib.setup.with(
  beschluss_nr: "2026-001",
  beschluss_text: "Lorem Ipsum",
  president: "Name Präsident",
  vice_president: "Name Vize",
  protocol: "Protokoll",
  date: datetime.today().display(),
  unterzeichner: "Unterzeichner"

)