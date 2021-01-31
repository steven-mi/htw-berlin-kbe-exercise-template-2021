# KBE Projekt Template

## TODOS
1. Ersetzen Sie die Überschrift mit `TEAMNAME`
2. Geben Sie Ihre Teammitglieder in die Tabelle ein
4. Folge **KBE Repository einrichten**
4. Folge den Anweisungen in der pom.xml
5. Erstelle die Branches (Groß- und Kleinschreibung beachten):
   - `runmerunner`
   - `songsservlet`
   - `songsWSa`
   - `songsWSb`

| Name          | Matrikelnummer  |
| :------------ | --------------- |
| TEAMMITGLIED1 | MATRIKELNUMMER1 |
| TEAMMITGLIED2 | MATRIKELNUMMER2 |



## KBE Repository einrichten

**Einen Fork vom Repository erstellen:**

![](.github/images/fork.png)

**Repository klonen:**

```bash
git clone LINK_ZUM_REPOSITORY
```

## Erste Schritte

### runmerunner clean, bauen, testen & verpacken

```
mvn -pl runmerunner clean package 
```

ODER

```
cd runmerunner
mvn clean package 
```



### songsservlet clean, bauen, testen & verpacken

```
mvn -pl songsservlet clean package 
```

ODER

```
cd songsservlet
mvn clean package 
```



###  songsWS clean, bauen, testen & verpacken
```
mvn -pl songsWS clean package 
```

ODER

```
cd songsWS 
mvn clean package
```



### Alle Projekte clean, bauen, testen & verpacken: > mvn clean package

```
mvn clean package
```






