import 'package:classes/EventMessage.dart';
import 'package:classes/EventPrompt.dart';

abstract class Event{
  int id; //kan nästan mer ses som ett index eller liknande, är endast unik inom varje AdventurePart, inte globalt genom Adventure classen.
  String type; //subclass
  int path; //pekare

  Event(int id, String type, int path){ //Standard constructor, ingen fromJson behövs då subclasserna sköter det innan de passerar värdena hit genom super()
    this.id = id;
    this.type = type;
    this.path = path;
  }

  //denna används pga att parts i nuläget indexeras från 1 i JSON. if-checken finns endast där för ifall det skulle indexeras från 0 slipper vi crasha appen.
  //byts indexeringen till att börja på 0 är det viktigt att detta tas bort, så paths kommer bli fel om denna används då.
  int getDestination(){
    if (path != 0) return path-1; 
    else return path;
  }

  //pga subclasser, och man vill kunna hantera dem alla som event även om de har olika toJson i subclasserna.
  Map<String, dynamic> toJson(){
    switch(type) {
      case "prompt": {
        return (this as EventPrompt).toJson();
      }
      break;
      case "message":{
        return (this as EventMessage).toJson();
      }
      break;
      default:{
        return {
          "id": id,
          "type": type,
          "path": path
        };
      }
      break;
    }
  }
}