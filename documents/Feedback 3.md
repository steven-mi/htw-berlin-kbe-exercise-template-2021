| Beleg 4 songsWS with /songLists                              |           |            |
| ------------------------------------------------------------ | --------- | ---------- |
| Teamname                                                     |           |            |
| Name                                                         |           |            |
| Name                                                         |           |            |
|                                                              | **Funkt** | **Punkte** |
| Requests to all endpoints must contain „Authorization“:      | 2         | 2          |
| Service is publicly available                                | 1         | 1          |
| \- No/BadToken: 401                                          | 1         | 1          |
| DB has two users with two songlists each                     | 2         | 2          |
| **GET ALL SongLists**: /songLists?userId=mmuster             |           |            |
| \- XML and JSON work                                         | 1         | 1          |
| \- userID = tokenUserID: returns all songs, private and public | 1         | 1          |
| \- userID != tokenUserID: returns all public songs of userID | 1         | 1          |
| **GET ONE SongList**: /songLists/<SONG_ID>                   |           |            |
| \- XML and JSON work                                         | 1         | 1          |
| \- userID = tokenUserID: returns any songList                | 1         | 1          |
| \- userID != tokenUserID, songlist is public: returns the public songList | 1         | 1          |
| \- userID != tokenUserID, songlist is private: returns 403   | 1         | 1          |
| **POST a SongList:**                                         |           |            |
| returns 201 and the new songListID                           | 2         | 2          |
| \- Payload with non-existing song or song with bad id: returns 400, not a 500 | 1         | 1          |
| **DELETE a SongList:** /songLists/<SONG_ID>                  |           |            |
| \- songList is owned by tokenUserID: 204 not a 500           | 1         | 1          |
| \- songList is not owned by tokenUserID: 403                 | 1         | 1          |
| **DELETE** /songs/<SONG_ID>: 204 & song is deleted from all songslists | 2         | 2          |
| **Tests**                                                    |           |            |
| \- HSQLDB **OR** a test schema in mysql/postgresql is used, i.e., another dbConfig file in "test/resources“ exists | 2         | 2          |
| \- tests for getAllSongList(userid)                          | 2         | 2          |
| \- tests for getSongList(iD)                                 | 2         | 2          |
| \- tests for saveSongList (newSongList)                      | 2         | 2          |
| \- tests for deleteSongList(songListid)                      | 2         | 2          |
| TOTAL                                                        | 30        | 30         |

