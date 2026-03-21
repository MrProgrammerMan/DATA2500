#figure(caption: [Oversikt over operasjonene i programmet.])[
#table(columns: 5,
  [4-bit opcode], [OP], [arg 0], [arg 1], [Funksjon],
  [0010], [MOVI], [Dest. reg.], [Int.], [Legger arg 0 i arg 1],
  [0100], [ADD], [Dest. reg.], [Reg.], [Legget arg 1 til arg 0],
  [1100], [CMP], [LHS], [RHS], [LHS == RHS?],
  [1111], [JNE], [Mem. adress], [n/a], [Forrige op usann? $=>$ Hopp til arg 0],
)
]
