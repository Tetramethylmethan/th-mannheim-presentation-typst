#import "../src/stura_beschluss_lib.typ" as lib: *

// Setup
#show: lib.setup.with(
  beschluss_nr: "2026-001",
  president: "Falko",
  vice_president: "Name Vize",
  protocol: "Protokoll",
  date: datetime.today().display("[day]. [month repr:long] [year]"),
  unterzeichner: "Unterzeichner"
)
Lorem Ipsum