== 7.19
```bash
chmod +700 $(find ...) && $(find ... -type f)
```
Kommandoen over er todelt. Først brukes `chmod +700` på alle mapper og filer under `...`. Deretter brukes `find -type f` til å finne en fil. Det er bare 1 fil i dette hiearkiet, og dette er en binærfil. vi kjører den direkte som output av find: `$()`.