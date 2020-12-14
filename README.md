# Basename em Smalltalk

## Dependencias

Instalação das dependencias em ambiente deb:

```
apt-get install gnu-smalltalk
```

## Como executar

```
./mybasename.st --help
./mybasename.st --version
./mybasename.st /usr/bin/sort
./mybasename.st -a /usr/bin/sort include/stdio.h
./mybasename.st --multiple /usr/bin/sort include/stdio.h
```

**obs:** Dê permissão de execução para o arquivo mybasename.st caso não possua: `chmod +x mybasename.st`.