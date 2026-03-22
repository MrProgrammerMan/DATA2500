== 7.12
Følgende kommando printer ut de 10 største filene i `/etc`:
```bash
ls -ls /etc | sort -rn | head -n 10 | awk '{$1=""; sub(/^ /,""); print}'
```
Trinn for trinn:
1. `ls -ls /etc` lister alle filer i `/etc` med deres størrelser i blokker.
2. `sort -rn` sorterer resultatet i omvendt numerisk rekkefølge, slik at de største filene kommer først.
3. `head -n 10` tar de første 10 linjene av det sorterte resultatet, som tilsvarer de 10 største filene.
4. `awk '{$1=""; sub(/^ /,""); print}'` er litt komplisert, men fungerer slik:
  - `{$1=""}` fjerner den første kolonnen (antall blokker). Dette har side-effekte av at awk bygger linje på nytt ved å sette sammen de restesende kolonnene med et enkel mellomrom mellom de. Dette er viktig fordi `ls -la` formatterer filstørrelsen slik at `8` får to ekstra mellomrom foran seg, `12` får ett, mens `123` får ingen.
  - `sub(/^ /,"")` fjerner det første mellomrommet i linjen, som oppstår fordi vi fjernet den første kolonnen. `^` matcher starten av linjen.
  - `print` skriver ut den modifiserte linjen, som nå ikke lenger inneholder filstørrelsen.

@largestfiles viser at kommandoe kjører.

#figure(image("../../imgs/week7-task12.png", width: 80%), caption: [ Kommando for å finne de 10 største filene i /etc ]) <largestfiles>