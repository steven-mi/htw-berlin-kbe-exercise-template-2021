# KBE Projekt Template

| Name          | Matrikelnummer  |
| :------------ | --------------- |
| TEAMMITGLIED1 | MATRIKELNUMMER1 |
| TEAMMITGLIED2 | MATRIKELNUMMER2 |



## KBE Repository einrichten

1. Einen Fork vom Repository erstellen:

![](.github/images/fork.png)

2. Lokal Repository klonen:
```bash
git clone LINK_ZUM_REPOSITORY
```

3. Ersetzen Sie die Überschrift in `README.md `mit `TEAMNAME`
4. Geben Sie Ihre Teammitglieder in die Tabelle der `README.md` ein
6. Folge den Anweisungen in der `pom.xml`

## KBE Repository Updates erhalten

```
# zum Repository gehen
cd PFAD_ZUM_REPOSITORY

# den kbe Remote setzen (muss man nur einmal machen)
git remote add kbe https://github.com/htwb-kbe/htwb-kbe-repo-template.git

# Updates holen
git pull kbe master

# Updates in das eigene Repository hinzufügen
git push
```


## Wichtige Informationen 

### Konventionen für Branch Namen
Für die Belege gilt folgender Branch Namen:
- runmerunner: `runmerunner`
- songsservlet: `songsservlet`
- songsWSa: `songsWSa`
- songsWSb: `songsWSb`

### Befehle die immer funktionieren müssen
#### runmerunner clean, bauen, testen & verpacken

```
mvn -pl runmerunner clean package 
```

ODER

```
cd runmerunner
mvn clean package 
```



#### songsservlet clean, bauen, testen & verpacken

```
mvn -pl songsservlet clean package 
```

ODER

```
cd songsservlet
mvn clean package 
```



####  songsWS clean, bauen, testen & verpacken
```
mvn -pl songsWS clean package 
```

ODER

```
cd songsWS 
mvn clean package
```



#### Alle Projekte clean, bauen, testen & verpacken: > mvn clean package

```
mvn clean package
```






