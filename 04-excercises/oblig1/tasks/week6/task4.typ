== 6.4

#figure(image("../../imgs/week6-task4-1.png", width: 80%), caption: [Screenshot av kommandoene kjørt])

#figure(image("../../imgs/week6-task4-2.png", width: 80%), caption: [Screenshot av esum.s])

Med tanke på resultatet er filene identiske. De er imidlertid ikke like! GCC har oppdaget at funksjonens return-verdi er konstant og har derfor valgt å optimalisere bort hele funksjonen. esum.s returnerer verdien 6 direkte.

#figure(image("../../imgs/week6-task4-3.png", width: 80%), caption: [Screenshot av esum.s (uoptimalisert)])

For å kunne endre verdien har jeg rekompilert esum.c med flaggene -O0, som fjerner de fleste kompilatoroptimaliseringene. Vi kan her se $4$ på cmpl-linjen. Dette er den nye maks-verdien i løkken.

#figure(image("../../imgs/week6-task4-4.png", width: 80%), caption: [Screenshot av kommandoene kjørt])

Endringen fungerer, og resultatet er nå 10.
