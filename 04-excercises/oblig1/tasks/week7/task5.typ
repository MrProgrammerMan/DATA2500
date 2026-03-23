== 7.5

Assembly-koden i @fibas er skrevet av meg, med unntak av linjene øverst. Jeg baserte meg på en av assembly-filene kompilert av gcc i en tidligere oppgave. Deretter brukte jeg KI til å kun beholde nødvendige linjer fra "metadataen" som starter med '.'.

#figure(image("../../imgs/week7-task5-1.png", width: 80%), caption: [Assembly-kode som finner fibonacci-tall]) <fibas>

@fibcint viser at vi ikke kan finne mer enn det 47. fibonacci-tallet uten å støte på en integer-overflow-error. Dette skyldes at svaret er større enn det som kan lagres i 32 bits(```c int```).

#figure(image("../../imgs/week7-task5-2.png", width: 80%), caption: [C-kode som forsøker å finne fibonacci-tall 47 & 48]) <fibcint>

@fibclonglong viser den samme koden kjørt med ```c long long``` istedenfor ```c int```. `main2.c` er tilpasset for ```c long long```. Her kan vi regne ut fibonacci-tall 93, men ikke 94.

#figure(image("../../imgs/week7-task5-3.png", width: 80%), caption: [C-kode som forsøker å finne fibonacci-tall 93 & 94]) <fibclonglong>