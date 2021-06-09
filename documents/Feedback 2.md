| Beleg 3 songsWS with /songs and /auth                        |       |        |      |        |
| ------------------------------------------------------------ | ----- | ------ | ---- | ------ |
| Teamname:                                                    |       |        |      |        |
| Name:                                                        |       |        |      |        |
| Name:                                                        |       |        |      |        |
|                                                              | Funkt | Punkte | Test | Punkte |
| http to /auth with correct payload returns 200 and token     | 1     |        | 1    |        |
| -d '{"userId":"mmuster","password":"pass1234"}'              | 0.5   |        |      |        |
| -d '{"userId":"eschuler","password":"pass1234"}'             | 0.5   |        |      |        |
| userID/key-combo does not exist: Service returns 401         |       |        | 1    |        |
| -d '{"userId":"mmuster","password":"geheim"}'                | 0.5   |        |      |        |
| -d '{"password":"pass1234"}'                                 | 0.5   |        |      |        |
| **GET:**                                                     |       |        |      |        |
| \- all works: XML & JSON                                     | 2     |        | 1    |        |
| \- one song works: XML & JSON                                | 2     |        | 1    |        |
| \- non-existing does not throw exception                     | 0.5   |        | 0.5  |        |
| \- returns song from db                                      | 2     |        | 1    |        |
| **POST**:                                                    |       |        |      |        |
| \- posting a song returns URL to new id in "location"-header & | 1     |        | 1    |        |
| \- song created                                              | 1     |        | 1    |        |
| \- posting a song creates object in db                       | 1     |        | 1    |        |
| **PUT**:                                                     |       |        |      |        |
| \- JSON works, 204                                           | 1     |        | 1    |        |
| \- song updated                                              | 1     |        | 1    |        |
| \- handling non-existing id in URL                           | 0.5   |        | 0.5  |        |
| \- handling different id in URL and payload                  | 1     |        | 1    |        |
| **DELETE:**                                                  | 1     |        | 1    |        |
| \- existing id works, 204                                    |       |        |      |        |
| \- song deleted                                              |       |        |      |        |
| \- non-exisiting id does not throw exception, 404            |       |        |      |        |
| DI of UserDAO & SongDAOs into controller classes             | 2     |        |      |        |
| Using a different UserDAO & SongsDAO (non-DB) in ControllerTests |       |        | 2    |        |
|                                                              |       |        |      |        |
| **Total:**                                                   | 19    |        | 12   |        |

**Comments:**
