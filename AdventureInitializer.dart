import 'package:classes/Adventure.dart';
import 'package:classes/AdventurePart.dart';
import 'package:classes/Event.dart';

import 'EventMessage.dart';
import 'EventPrompt.dart';
/**
 * Denna class används för att skapa ett Adventure objekt. På grund av alla dependencies mellan de olika classerna krävs en del "yttre" kod för att instanciera ett objekt korrekt.
 * Största anledningen är events, då de kan vara flera olika subclasser i samma JSON map, och det inte är möjligt att loopa direkt i constructorn eller använda if/else.
 * AdventurePart och Adventure skapas alltså nu med tomma listor (_parts och _events). Därefter fylls listorna med setParts() och setEvents(). Dessa listor tas ut från
 * JSON filen extern, i denna class alltså.
 * 
 * För att skapa ett Adventure objekt skickas en Map<String, dynamic> till metoden initAdventure() genom en instans av AdventureInitializer. Sen sköts resten antingen av denna class
 * eller constructorerna.
 * 
 * Skapandet av ett Adventure är O(x*y) minst.
*/
class AdventureInitializer{
  AdventureInitializer();

  //skapar en instans av adventure. Skapandet av ett objekt sker i O(x*y). Alltså är det väldigt långsamt om det blir större objekt.
  Adventure initAdventure(Map<String, dynamic>json){
    List<AdventurePart> parts = partsFromJson(json);
    Adventure adventure = Adventure.fromJson(json);
    adventure.parts = parts;

    return adventure;
  }

  //skapar adventureparts
  List<AdventurePart> partsFromJson(Map<String, dynamic> json){
    List temp = json["parts"];
    List<AdventurePart> result = new List();
    for(int i = 0; i<temp.length; i++){
      List<Event> events = eventsFromJson(temp[i]);
      AdventurePart part = AdventurePart.fromJson(temp[i]);
      part.events = events;
      result.add(part);
    }

    return result;
  }

  //skapar events
  List<Event> eventsFromJson(Map<String, Object> json){
    List temp = json["events"]; // temp är här en List<Map<String, Object>>. Alltså en lista av maps, där varje map är Strings mappade till objekt. objekten är värden för ett event.
    List<Event> result = new List();
    for(int i = 0; i<temp.length; i++){ //itererar över alla mapsen i listan

      Map tempMap = temp[i]; // tempMap är här ett event objekt i JSON.
      String tempStr = tempMap["type"]; //tar ut det objekt mappat mot "type", dsv en String som är namnet på vilken subclass Eventet är av.

      //Här används tempStr för att avgöra vilken subclass som ska instantieras, dsv skapas, för varje JSON objekt som finns i listan temp.
      //Sedan skapas rätt subclass, och läggs in i listan result.
      if (tempStr == "prompt"){
        Event prompt = EventPrompt.fromJson(tempMap);
        result.add(prompt);
      }
      else if (tempStr == "message"){
        result.add(EventMessage.fromJson(tempMap));
      }
    }
    return result;
  }
}