# Komponentenbasierte Entwicklung (Ü): Beleg 2 - Songsservlet

##  User Story

Die „Chief“-Softwarearchitektin und der Product Owner von SONGSANDO, GmbH möchten einen „Proof of Concept“ für einen neuen Webservice durchführen und erst einmal eine einfache Version des Webservices von Ihnen erstellen lassen, welcher folgende Anforderungen erfüllen muss:

##  Aufgabe

1. Der Webservice **muss** die Servlet API 4.0 nutzen und in einem lokal laufendend Servlet-Container, Tomcat 9.x, deployed werden.

2. Der Webservice **soll** eine In-Memory Datenbank nutzen z.B. HSQLDB. Die Datenbank **soll** mit den 10 Songs in der Datei `songsservlet/src/main/resources/songs.json` initialisiert werden. Die relationale Datenbank **muss** eine Tabelle für Songs enthalten. Die Tabelle **muss** aus genau diesen 5 Spalten bestehen:
   ```sql
   “id” (INT, NOT NULL, PRIMARY KEY), 
   “title” (VARCHAR(100), NOT NULL), 
   “artist” (VARCHAR(100)), 
   ”label” (VARCHAR(100)), 
   ”released” (INT)
   ```
   
3. Der Webservice **muss** folgenden **HTTP-POST-Request** handhaben können:

   ```http
   POST http://localhost:8080/songsservlet-TEAMNAME/songs
   Content-Type: application/json
   ```

   mit Payload

   ```json
   {"title":"Wrecking Ball","artist":"MILEY CYRUS","label":"RCA","released":2013}    
   ```

   Das Format der Payload ist vorgegeben und **darf nicht geändert werden**.

   Falls die HTTP-Anfrage vom Client korrekt gestellt wurde, **muss** Ihr Service für den Song aus der Payload eine neue, einzigartige Id erstellen und den Song in der entsprechenden Datenbanktabelle speichern. Als HTTP-Response **muss** Ihr Service den HTTP-Statuscode 201 und den Pfad zum neuen Song im Location-Header zurückliefern:

   ```http
   HTTP/1.1 201 Created
   Location: /songsservlet-TEAMNAME/songs?songId=NEW_SONGID
   ```

4. Der Webservice **muss** folgende **zwei** **HTTP-GET-Requests** handhaben können:

   **GET SONG**

   ```http
   GET http://localhost:8080/songsservlet-TEAMNAME/songs?songId=A_SONGID
   Accept: application/json
   ```

   **Beispiel:** ```http://localhost:8080/songsservlet-TEAMNAME/songs?songId=2```

   Falls die HTTP-Anfrage vom Client korrekt gestellt wurde und erfolgreich von Ihrem Service bearbeitet wurde, liefert Ihr Service den Song mit Id 2 aus der DB-Tabelle in JSON-Format zurück. Beispiel für die entsprechende HTTP-Response:

   ```http
   HTTP/1.1 200 OK
   Content-Type: application/json
   …
   Payload:
   {"id":2,"title":"Breaking Hell","artist":"Smiley C.","label":"RCA","released":2019}
   ```

   **GET ALL SONGS**
   ```http
   GET http://localhost:8080/songsservlet-TEAMNAME/songs?all
   Accept: application/json
   ```
   
   Falls die HTTP-Anfrage vom Client korrekt gestellt wurde und erfolgreich von Ihrem Service bearbeitet wurde, liefert Ihr Service eine Liste aller Songs aus Ihrer DB-Tabelle in JSON-Format zurück. Beispiel für die entsprechende HTTP-Response:
   
   ```http
   HTTP/1.1 200 OK
   Content-Type: application/json
   …
   Payload:
   [{"id":1,"title":"7 Years","artist":"LGraham","label":"Blue","released":2015},
   {"id":2,"title":"Breaking Hell","artist":"Smiley C.","label":"RCA","released":2019}
   {"id":3,"title":"Wrecking Ball","artist":"MILEY CYRUS","label":"RCA","released":2013}]
   ```
      
5. Ihr Webservice **muss** alle inkorrekten Client-Requests entsprechend RFC 2616, Section 10.04: https://tools.ietf.org/html/rfc2616#section-10.4 handhaben. HTTP-Methoden, die Ihr Service nicht anbietet (wie HTTP-PUT und HTTP-DELETE) **müssen** mit dem Statuscode 405 beantwortet werden.
