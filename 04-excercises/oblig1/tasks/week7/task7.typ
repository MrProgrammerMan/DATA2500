== 7.7
Vi har hash-strengen: `$6$AB.f/K06$IsV3oABaBO4UEBertVwViFgqFcuRvPfBDBVojDJkwg43AlPlgfD.y8nCpjnb01EgwwrVaxpYRzYjgT5G1g4lw.`
Her er `6` knyttet til algoritmen som ble brukt til å hashe passordet. Dette er ikke standard, siden vi får `y` når vi kjører ```bash mkpasswd abc```. Ved å kjøre ```bash man mkpasswd``` kan vi se at `-m` flagget kan brukes til å sette algoritmen. ```bash mkpasswd -m help``` viser at `sha512crypt` er algoritmen som står bak `6`.

Altså er vi nødt til å bruke ```bash mkpasswd -m sha512crypt -S AB.f/K06``` for å finne passordet. `AB.f/K06` er saltet som er brukt.

@passcrack viser et script som tester alle strenger fra `aaa` til `zzz` for å finne passordet. Ved kjøring får vi at passordet er `tre`.

#figure(image("../../imgs/week7-task7.png", width: 80%), caption: [ Script som tester alle strenger fra `aaa` til `zzz` for å finne passordet ]) <passcrack>