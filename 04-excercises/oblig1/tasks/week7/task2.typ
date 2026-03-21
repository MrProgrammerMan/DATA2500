== 7.2

enlinje.c gir samme resultat som en.s:
#figure(image("../../imgs/week7-task2-1.png", width: 80%), caption: [enlinje.c kompileres og kjøres med main.c])

Vi kan se hva enlinje.c kompileres til:
#figure(image("../../imgs/week7-task2-2.png", width: 80%), caption: [enlinje.s er resultatet av enlinje.c kompilert av `gcc -S`]) <enlinje.s>

Resultatet i @enlinje.s viser at addisjonen blir mange linjer assembly. Verdiene `svar` og `memvar` legges på stacken, og svaret legges ikke direkte i `eax`. I en mer optimaliserte versjon av kompilatoren vil man trolig kunne få færre kodelinjer, men ikke så få som i c-koden som blir kompilert.

I @longlong kan vi se at ved å endre til `long long` kan vi se at assembly-koden allokerer mer plass til variblene. Det blir satt av 8 bytes til hver istedenfor 4.
#figure(image("../../imgs/week7-task2-3.png", width: 80%), caption: [Relevant del av enlinje.s etter at `int` er byttet med `long long` i enlinje.c]) <longlong>