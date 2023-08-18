import 'package:classes/Event.dart';

class EventMessage extends Event{
  String message;

  EventMessage(String message, int id, int path) //Standard constructor, mestadels för att göra det möjligt att skapa äventyr från appen senare
    : this.message = message,
      super(id, "message", path);

  EventMessage.fromJson(Map<String, dynamic> json)// den constructor som används när man läser in äventyr från databasen
    : message = json["message"],
      super(json["id"], json["type"], json["path"]);

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "type": type,
      "message": message,
      "path": path
    };
  }

  String toString(){
    return "\n  {\n    id: "+id.toString()+"\n" "    type: "+type+"\n" "    path: "+path.toString()+"\n" "    message: "+message+"\n  }";
  }
}