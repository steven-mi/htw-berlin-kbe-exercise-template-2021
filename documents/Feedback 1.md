| Beleg 2 SongsServlet                                |           |            | 
| --------------------------------------------------- | --------- | ---------- | 
| Name:                                               |           |            |   
| Name:                                               |           |            | 
|                                                     | **Funkt** | **Punkte** | 
| DB initialised with 10 songs                           | 1         |   1         | 
| **Put** (1): returns 405                            | 1         |   1         | 
| **Delete**(1): returns 405                          | 1         |   1         |  
| **Get ALL** (1):                                        |           |         | 
| \- all: all songs in JSON                           | 1         |   1         |
| **Get song** (6):                                   |           |             | 
| \- songId=existingID: the song in JSON              | 1         |   1         | 
| \- id=non-existingID: returns 404                   | 1         |   1         |   
| \- id="someString": returns 400, not 500s           | 1         |   1         |  
| \- bad/no params: returns 400                       | 1         |   1         |   
| \- no Accept-Header: returns JSON                   | 1         |   1         |   
| \- Accept-Header not JSON: returns 406 or JSON      | 1         |   1         | 
| **Post** (6):                                       |           |             |    
| posting a JSON song correctly:                      |           |             |   
| \- returns 201                                      | 1         |   1         | 
| \- and new Id in location header                    | 1         |   1         |    
| posting only title                                  | 1         |   1         |    
| posting non-JSON: 400                               | 1         |   1         |      
| posting XML: 400 or 415                             | 1         |   1         |        
| posting empty file: 400                             | 1         |   1         |       
| **init/destroy/thread safety** (1)**:**             |           |             |        
| Wie kreiieren Sie die EMF? Wo wird sie geschlossen? | 1         |    1        |      
| **Points:**                                         | 17        |             | 
| **Total:**                                          |           |             |    
