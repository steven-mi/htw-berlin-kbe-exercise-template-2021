| Beleg 2 SongsServlet                                |           |            |
| --------------------------------------------------- | --------- | ---------- |
| Teamname:       Sima                                    |           |            |
| Name:                                               |           |            |
| Name:                                               |           |            |
|                                                     | **Funkt** | **Punkte** |
| **Put** (1): returns 405                            | 1         |            |
| **Delete**(1): returns 405                          | 1         |            |
| **Get** (9):                                        |           |            |
| \- songId=existingID: the song in JSON              | 1         |            |
| song from DB-table                                  | 1         |            |
| \- all: all songs in JSON                           | 1         |            |
| all songs from DB                                   | 1         |            |
| \- id=non-existingID: returns 404                   | 1         |            |
| \- id="someString": returns 400, not 500s           | 1         |            |
| \- bad/no params: returns 400                       | 1         |            |
| \- no Accept-Header: returns JSON                   | 1         |            |
| \- Accept-Header not JSON: returns 406 or JSON      | 1         |            |
| **Post** (8):                                       |           |            |
| posting a JSON song correctly:                      | 1         |            |
| \- returns 201                                      | 1         |            |
| \- and new Id in location header                    | 1         |            |
| \- songs is added to db-table                       | 1         |            |
| posting only title                                  | 1         |            |
| posting non-JSON: 400                               | 1         |            |
| posting XML: 400 or 415                             | 1         |            |
| posting empty file: 400                             | 1         |            |
| **init/destroy/thread safety** (1)**:**             |           |            |
| Wie kreiieren Sie die EMF? Wo wird sie geschlossen? | 1         |    1        |
| **Points:**                                         | 20        |            |
