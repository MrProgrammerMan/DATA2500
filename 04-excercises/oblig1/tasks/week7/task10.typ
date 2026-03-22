== 7.10
`sed` er et lavnivå tekstredigeringsverktøy som kan brukes til å utføre grunnleggende teksttransformasjoner på en strøm av tekst. Det kan brukes til å erstatte, slette, sette inn eller endre tekst i en fil eller i en strøm av tekst.

```bash
sed 's/old/new/g' input.txt > output.txt
```

@sed viser kommandoen som oppdaterer epostadressene i `input.txt` ved å erstatte `stud.hioa.no` med `oslomet.no`, og lagrer resultatet i `output.txt`.

#figure(image("../../imgs/week7-task10.png", width: 80%), caption: [ `sed` brues til å ersatte stud.hioa.no med oslomet.no ]) <sed>