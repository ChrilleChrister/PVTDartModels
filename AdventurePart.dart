import 'package:classes/Event.dart';
import 'package:classes/Location.dart';

class AdventurePart{
  int part; //kan ses som ett slags id, eller index
  Location location; //se locaion Location.dart
  List<Event> events;

  AdventurePart(int part, Location location, List<Event> events){ //Standard constructor, mestadels för att göra det möjligt att skapa äventyr från appen senare
    this.part = part;
    this.location = location;
    this.events = events;
  }

  Map<String, dynamic> toJson(){
    List<Map<String, dynamic>> jsonEvents = [];
    events.forEach((event) => jsonEvents.add(event.toJson()));
    return{
      "part": part,
      "location": location.toString(),
      "events": jsonEvents
    };
  }

  AdventurePart.fromJson(Map<String, dynamic> json)// den constructor som används när man läser in äventyr från databasen
    : part = json["part"],
      location = new Location.fromJson(json["location"]),
      events = []; //Sätts till en tom lista för att förhindra null

  String toString(){
    return "{\n  part: "+part.toString()+"\n"+"  location: "+location.toString()+"\n" "  events: "+events.toString()+"\n}";
  }
}