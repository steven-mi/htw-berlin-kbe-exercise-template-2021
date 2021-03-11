# Komponentenbasierte Entwicklung (Ü):  Beleg 1 - RunMeRunner

##  User Story

Als Entwickler/in möchte ich ein Mini-Framework namens “runMeRunner” schreiben. RunMeRunner soll eine User-gegebene Klasse laden, darin deklarierte Methoden, die mit einer bestimmten Annotation versehen sind, finden, aufrufen und eine Analyse über die Methoden der Klasse ausgeben.

##  Aufgabe

1. Sie müssen eine Annotation namens „RunMe“ in der Datei **RunMe.java** im Package **htwb.ai** erstellen. Die Annotation soll zur Laufzeit ausgewertet werden und soll nur für Methoden verwendet werden.

2. Ihr Programm muss so aufgerufen werden: `java -jar runmerunner-TEAMNAME.jar className` wobei `className` der vollständige Name einer Klasse ist.

   Beispiel:

   ```bash
   $> java -jar runmerunner-TEAMNAME.jar de.htw.schueler.MeanTestMethods
   oder
   $> java -jar runmerunner-TEAMNAME.jar java.lang.Number
   oder
   $> java -jar runmerunner-TEAMNAME.jar java.io.Closable
   ```

3. Die zu ladene Klasse kann Methoden deklarieren, die mit der Annotation `@RunMe`versehen sind. Methoden, die mit `@RunMe` annotiert sind, sollen von Ihrem Programm ausgeführt werden. Die Ausgabe Ihres Programms in der Kommandozeile muss eine Auflistung über alle deklarierten Methoden der Klasse sein:

   - alle Methodennamen ohne `@RunMe`, alle Methodennamen mit `@RunMe`, Auflistung der `@RunMe`-Methoden, die von Ihrem Programm nicht ausgeführt werden konnten mit Grund

   - Die Ausgabe in der Kommandozeile **muss** so aussehen (Beispiel):

     ```bash
     $> java -jar runmerunner-TEAMNAME.jar de.htw.schueler.MeanTestMethods
     Analyzed class ‘de.htw.schueler.MeanTestMethods’:
     Methods without @RunMe:
     testWithoutRM
     testNoRM
     Methods with @RunMe:
     findMe
     findMe
     findMe
     findMe
     findMe
     findMe
     not invocable:
     findMe3: IllegalAccessException
     ```

   4. Die Users Ihres Programms können bei der Befehleingabe Fehler machen. Diese Fehler muss Ihr Programm erfassen, angeben und eine Usage-Message ausgeben. Beispiele (das ist keine vollständige Liste):

      ```bash
      $> java -jar runmerunner-TEAMNAME.jar blub
      Error: Could not find class blub
      Usage: java -jar runmerunner-TEAMNAME.jar className
      
      $> java -jar runmerunner-TEAMNAME.jar java.io.Closeable
      Error: Could not instantiate class java.io.Closeable
      Usage: java -jar runmerunner-TEAMNAME.jar className
      ```

   5. **Alle TestCases müssen mit UnitTests abgedeckt sein. UnitTests werden bewertet.**

