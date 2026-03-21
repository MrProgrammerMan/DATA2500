== 7.1

#figure(image("../../imgs/week7-task1.png", width: 80%), caption: [Filene main.c og en.s kjører og gir svaret 42])

Variablene svar og memvar defineres til 32 og 10. Deretter legges memvar i et register(`%rbx`), svar legges til dette registeret, og svaret flyttes til `%rax`, slik at dette returneres ved `ret`.