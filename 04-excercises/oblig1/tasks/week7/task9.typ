== 7.9
Vi kan bruke `-newermt`, som gir filer med nyere modifikasjonstid(m) enn den gitte datoen(t). Vi kan legge på en ekstra betingelse for å finne filer som er modifisert mellom to datoer ved å bruke `-newermt` for den første datoen og `! -newermt` for den andre datoen.

```bash
find ~ -newermt 2026-03-19 ! -newermt 2026-03-20 -ls
```

@findnewer viser output fra kommandoen.

#figure(image("../../imgs/week7-task9.png", width: 80%), caption: [ Kommando for å finne filer modifisert mellom 19. og 20. mars 2026 ]) <findnewer>