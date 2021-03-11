# Komponentenbasierte Entwicklung (Ü): songsWS mit Authentifizierung und neuem Endpoint /rest/songLists

##  Teil 1

Sie haben in Beleg 3 den Endpoint `/rest/auth` zur Authentifizierung der Nutzer_innen Ihres Songs-Webservice implementiert. In dieser Teilaufgabe geht es nun darum, den Token, der bei erfolgreicher Authentifizierung generiert worden ist, auch zu nutzen. Beispiel: Nutzerin mmuster hat sich erfolgreich bei Ihrem Songs-WS angemeldet und hat den Token `qwertyuiiooxd1a245` zurückgeschickt bekommen. Von jetzt an muss `mmuster` diesen Token **in allen nachfolgenden Anfragen an Ihren Service mitschicken** und zwar im HTTP-Header "Authorization". Alle GET/POST/PUT/DELETE-Anfragen an `/rest/songs` und an `/rest/songLists` (siehe Teil 2) müssen jetzt auch einen Authorization-Header haben, der den generierten Token enthält. Beispiel "mmuster hätte gern alle Songs in JSON" und schickt folgenden GET-Request an `songsWS-TEAMNAME`:

```
GET /songsWS-TEAMNAME/rest/songs 
Accept: application/json
Authorization: qwertyuiiooxd1a245
```

Nur wenn ein gültiger Token im Authorization-Header vorhanden ist, darf Ihr Server die Anfrage entsprechend bedienen und mit einem Success-HTTP-code von 20x antworten. Falls kein oder kein gültiger Token im Authorization-Header vorhanden ist, muss Ihr Service mit HTTP-Code 401 antworten.

## Teil 2

In diesem Beleg werden Sie einen weiteren Endpoint `/songsWS-TEAMNAME/rest/songLists` implementieren. Dieser Endpoint wird Listen von Songs (playlists) ausliefern, empfangen und löschen. Zusätzlich zu unserer Songs-Collection legen wir eine Sammlung von Songlisten und entsprechende DB-Tabellen an. Eine Songliste hat folgende Eigenschaften:

- Id (Integer, PK, auto-incremented/-generated)
- OwnerId (User, FK)
- einen Namen
- ist “private” oder “public”
- eine Liste von Songs

D.h., eine Songliste hat einen Namen, gehört einer Owner-Person und kann “private“ oder “public“ sein.  Die Songs gehören allen Users, haben also keine Besitzer_innen.

**Der neue Endpunkt kann wie folgt erreicht werden:**

- `/songsWS-TEAMNAME/rest/songLists/`                
- `/songsWS-TEAMNAME/rest/songLists?userId=SOME_USERID`

Zum Verständnis der Anforderungen nehmen wir an, dass 

- User mmuster hat sich bei Ihrem Service erfolgreich angemeldet und den Token `qwertyuiiooxd1a245` erhalten.
- HTTP-Anfragen von mmuster an Ihren Service enthalten den Header `Authorization: qwertyuiiooxd1a245`. Diesen Header werde ich übersichtshalber im Folgenden weglassen.

### Anforderungen an den “songLists”-Endpoint

1. **GET von Songlisten implementieren:**
   1. Ausgabeformate für GET sind JSON und XML
   2. `GET /rest/songLists?userId=SOME_USERID`
      - `GET /rest/songLists?userId=mmuster`: soll alle Songlisten von mmuster an User mmuster zurückschicken.
      - `GET /rest/songLists?userId=eschuler`: soll nur die public Songlisten von ‘eschuler’ an User ‘mmuster’ zurückschicken.
      - `GET /rest/songLists?userId=usergibtsnicht`: schickt HTTP-Statuscode 404 zurück.
   3. `GET /rest/songLists/`
      - `GET /rest/songLists/22`: soll die Songliste 22 an User ‘mmuster’ zurückschicken. Eine Songliste 22 muss existieren. Wenn die Liste mmuster gehört, dann kann sie an mmuster zurückgeschickt werden. Wenn die Liste einem anderen User gehört, dann kann die Liste nur zurückgeschickt werden, wenn sie “public” ist, ansonsten einen HTTP-Status 403 (FORBIDDEN) schicken.
2.  **POST von Songlisten implementieren:**
   1. Eingabeformat ist JSON
   2. POST `/rest/songLists` mit Payload im korrekten JSON-Format legt eine neue Songliste an. Songlisten, die gepostet werden, enthalten keine SongList-Ids, da diese von Ihrem Service oder der DB vergeben werden. Owner der neuen Songliste soll aus dem Token im Authorization-Header ermittelt werden. Falls erfolgreich, d.h., neue Songlist für User mmuster wurde angelegt, dann schickt Ihr Service die URL mit neuer SongList-Id im Location-Header zurück. 
   3. Alle Songs in der Payload der Anfrage müssen in der DB existieren. Falls einer der Songs nicht existiert, können Sie einfachheitshalber eine 400 (BAD_REQUEST) zurückschicken. 
   4. In Moodle werde ich Ihnen Payloads für Songlisten in JSON bereitstellen. Diese Payloads können zum Testen des POST-Endpoints verwendet werden.
3. **DELETE von Songlisten implementieren:**

   1. DELETE `/rest/songLists/`: User können nur eigene Songlisten löschen, nicht die der anderen User, auch keine fremden, public Songlisten.

      - `DELETE /rest/songLists/22`: Löscht die Songliste 22, falls diese ‘mmuster’ gehört.

      - `DELETE /rest/songLists/33` von User ‘mmuster’ requested, aber 33 gehört eschuler, soll von Ihrem Service mit HTTP-StatusCode 403 (FORBIDDEN) abgewiesen werden. 
4. **PUT von Songlisten muss nicht implementiert werden.**
5. **mmuster und eschuler müssen in Ihrer DB jeweils 2 Songlisten besitzen**
   1. mmuster besitzt eine private (id=1) und eine public Songliste (id=2) 
      - Die privaten Liste von mmuster muss die Songs mit der id 4 und 5 enthalten
6. eschuler besitzt eine private (id=3) und eine public Songliste (id=4) 
7. Bei den **Unit/Integration-Tests** muss als Test-Datenbanksystem HSQLDB **(**[**http://hsqldb.org/**](http://hsqldb.org/)**)** genutzt werden.
8. Der **GitVersionController muss funktionieren**. Code dafür wird in Moodle hochgeladen. Der Controller ist über `songsWS-TEAMNAME/rest/version` erreichbar.
9. Sie müssen ihren Service auf einen Cloud-Anbieter bereitstellen. 
