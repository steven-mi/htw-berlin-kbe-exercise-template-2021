KBE SoSe2020

Teamname: TEAMNAME

Mitglied:
Matrikelnummer:

Mitglied:
Matrikelnummer:


Instructions to commit&push this project structure into gitHub:

1) git clone/checkout your 'TEAMNAME'-KBE repository
2) cd 'TEAMNAME'-KBE
3) Before putting the new project structure into git, clean up old files and dirs: 
   'TEAMNAME'-KBE/> rm -rf *
   'TEAMNAME'-KBE/> git commit -m "clean up and prep" FILES_AND_DIRS_YOU_DELETED
   'TEAMNAME'-KBE/> git push
   'TEAMNAME'-KBE/> cd ..

4) Now copy the new project structure into your 'TEAMNAME'-KBE-repo:
   cp KBE-REPO-STRUCT/README.md 'TEAMNAME'-KBE/
   cp KBE-REPO-STRUCT/pom.xml 'TEAMNAME'-KBE/
   cp -r KBE-REPO-STRUCT/runmerunner 'TEAMNAME'-KBE/
   cp -r KBE-REPO-STRUCT/songsservlet 'TEAMNAME'-KBE/
   cp -r KBE-REPO-STRUCT/songsWS 'TEAMNAME'-KBE/

5) !IMPORTANT!  Before you continue, change all references 
   of 'TEAMNAME' to your actual teamname. You can do this 
   in your IDE (a project-global replace/refactor) or by hand: 
   
   Edit all pom.xml's, directories and .java-files

6) Now commit & push the new project structure into git:
	> cd 'TEAMNAME'-KBE/
   'TEAMNAME'-KBE> git status (should list all of the above)
   'TEAMNAME'-KBE> git add README.md pom.xml runmerunner/ songsservlet/ songsWS/
   'TEAMNAME'-KBE> git commit -m "KBE projects" README.md pom.xml runmerunner/ songsservlet/ songsWS/
   'TEAMNAME'-KBE> git push

7) Test that everything ended up in git:
   The other team member clones or checks out your git-repo 


runmerunner clean, bauen, testen & verpacken:

	> mvn -pl runmerunner clean package 
ODER
	> cd runmerunner 
	runmerunner/> mvn clean package 


songsservlet clean, bauen, testen & verpacken:

	> mvn -pl songsservlet clean package 
ODER
	> cd songsservlet 
	songsservlet/> mvn clean package 


songsWS clean, bauen, testen & verpacken:

	> mvn -pl songsWS clean package 
ODER
	> cd songsWS 
	songsWS/> mvn clean package


Alle Projekte cleanen, bauen, testen & verpacken:
	> mvn clean package



