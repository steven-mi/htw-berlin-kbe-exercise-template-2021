# Komponentenbasierte Entwicklung (Ü): Beleg 3 - songsWS mit „songs“- und „auth“-Endpoints

##  User Story

Der Prototyp für einen Songs-Webservice ist vom Management der SONGSANDO GmbH gut aufgenommen worden. Jetzt geht es darum, den Prototyp in einen vollständigen RESTful Webservice umzuschreiben. 

##  Aufgabe

### Teil 1: Implementierung des Endpoints /songsWS-TEAMNAME/rest/songs

1. Der Endpoint für Ihren neuen Songs-Service ist `http://localhost:8080/songsWS-TEAMNAME/rest/songs`

2. Dieser Endpoint soll die vier HTTP-Methoden GET, POST, PUT, DELETE implementieren. **GET** muss als **Ausgabeformate JSON und XML** handhaben können. **POST** und **PUT** müssen **nur JSON als Eingabeformat** handhaben können:

   `GET http://localhost:8080/songsWS-TEAMNAME/rest/songs`: Ihr Service schickt alle Songs zurück

   `GET http://localhost:8080/songsWS-TEAMNAME/rest/songs/1`: Ihr Service schickt Song mit id = 1 zurück, 1 <= id <= n

   `POST http://localhost:8080/songsWS-TEAMNAME/rest/songs`: mit Song in der Payload (wie in Beleg 2, nur „title“ darf nicht leer sein). Wenn erfolgreich, legt Ihr Service den neuen Song an und schickt Statuscode 201 und URI (/rest/songs/<id>) zur neuen Ressource im „Location“-Header zurück 

   `PUT http://localhost:8080/songsWS-TEAMNAME/rest/songs/1`  mit Song in der Payload. Ihr Service darf das Update nur dann durchführen, wenn „songId“ in URL gleich „id“ in Payload ist („title“-Attribute, wie in POST, darf nicht leer sein). Wenn Update erfolgreich, dann nur Statuscode 204 zurückschicken, ansonsten 400 bzw. 404

    `DELETE http://localhost:8080/songsWS-TEAMNAME/rest/songs/1`: Ihr Service löscht den Song, aber der Song mit der songId aus der URL muss existieren; wenn Löschen des Songs erfolgreich, dann nur Statuscode 204 zurückschicken, ansonsten 400 bzw. 404

3. Bitte immer daran denken, dass die Anfragen Ihrer Clients fehlerhaft sein können und dass diese Fehler, keine Serverfehler (500er Statuscode) erzeugen sollten. Also, **erst Test Cases überlegen**, **dann implementieren!**



### Teil 2: Implementierung des Endpoints /songsWS-TEAMNAME/rest/auth

**Erst wenn Sie mit Teil 1 fertig sind, dürfen Sie mit Teil 2 anfangen. Hier soll es um den ‘auth’-Endpoint Ihres Webservices gehen.** 

1. In Ihrer Datenbank legen Sie sich bitte eine Tabelle für die Nutzer/innen Ihres Webservices an:

   ```SQL
   CREATE TABLE IF NOT EXISTS `user` ( 
   	`userId` VARCHAR(50) NOT NULL , 
   	`password` VARCHAR(50) NOT NULL ,
   	`firstName` VARCHAR(50) NOT NULL ,
   	`lastName` VARCHAR(50) NOT NULL , 
   	 PRIMARY KEY (`userId`) 
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   ```

   **Achtung**: Das ist MySQL-SQL und funktioniert in PostgreSQL nicht.

2. Die Tabelle muss diese zwei Nutzerinnen enthalten:

   ``` 
   userId = mmuster, password=pass1234, firstName=Maxime, lastName=Muster
   userId = eschuler, password=pass1234, firstName=Elena, lastName=Schuler
   ```

   Sie können sich auch noch andere Users anlegen, aber die beiden obigen müssen genau so in Ihrer Datenbank vorhanden sein. 

3. Mit den HTTP-Anfragen:

   ```bash
   curl -X POST \
        -H "Content-Type: application/json" \
        -v "https://localhost:8080/songsWS-TEAMNAME/rest/auth" \
        -d '{"userId":"mmuster","password":"pass1234"}'
   
   curl -X POST \
        -H "Content-Type: application/json" \
        -v "https://localhost:8080/songsWS-TEAMNAME/rest/auth" \
        -d '{"userId":"eschuler","password":"pass1234"}'
   ```

   sollen sich die Nutzerinnen mmuster bzw. eschuler bei Ihrem Webservice anmelden. Ist die User-Anmeldung erfolgreich, d.h., userId/password -Kombination existiert in Ihrer DB, dann generiert Ihr Service einen zufälligen, nicht zu langen Authorization-Token und schickt diesen im Message-Body der Antwort zurück. Antwort Ihres Servers auf obige Anfragen: 

   ```
   StatusCode: 200, OK  
   Content-Type: “text/plain” 
   qwertyuiiooxd1a245 # Payload enthält nur diesen String (Beispiel eines generierten, zufälligen, „nicht allzu langen“ Tokens) 
   ```

   Was ist, bei invaliden User-Authentication-Requests zu tun?  Beispiel:

   ```
   curl -X POST \
        -H "Content-Type: application/json" \
        -v "https://localhost:8443/songsWS-TEAMNAME/rest/auth" \
        -d '{"userId":"mmuster","password":"geheim"}'
   ```

   Die Kombo “mmuster/ geheim” gibt es in Ihrer DB nicht. Antwort des Servers: `HTTP-Statuscode 401`(User kann nicht authentifiziert werden)

## Was ist außerdem zu tun?

- Spring MVC und Hibernate nutzen
- DI nutzen und die DAOs in die entsprechenden Controller injizieren
- Unit-Tests für alle public-Methoden der Controller-Klassen
- Ihr Code nutzt eine logische/praktische Package-Strukturs
