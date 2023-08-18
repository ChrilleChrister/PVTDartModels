import 'package:classes/AdventurePart.dart';
/**
 * Adventure är top-objektet i arkitekturen. Ett adventure har en lista av AdventureParts, som i sin tur har varsin lista av Events. Varje Event pekar mot nästa event, och AdventureParts
 * saknar pekare i nuläget, de itereras alltså linjärt.
 */
class Adventure{
  int length; //längden av äventyret, i tid
  String title;
  List<AdventurePart> parts;

  String id; //skapas i databasen
  
  Adventure(String title, List<AdventurePart> parts, int length){ //Standard constructor, mestadels för att göra det möjligt att skapa äventyr från appen senare
    this.title = title;
    this.length = length;
    this.parts = parts;
  }

  Map<String, dynamic> toJson(){
    List<Map<String, dynamic>> jsonParts = [];
    parts.forEach((part) => jsonParts.add(part.toJson()));
    return{
      "length": length,
      "Adventuretitle": title,
      "parts": jsonParts
    };
  }

  Adventure.fromJson(Map<String, dynamic> json) // den constructor som används när man läser in äventyr från databasen
    : this.title = json["adventureTitle"],
      this.length = json["length"],
      this.parts = [], //skapar en tom lista för att undvika null
      this.id = json["id"];

  //På grund av arkitekturen av classerna så kan inte parts läggas till genom constructorn, därför måste setparts kallas efter ett Adventure
  //skapats för att fylla listan _parts

  AdventurePart getFirstAdventurePart(){
    return parts[0];
  }

  String toString(){
    return "Id: "+id+"\n"+"Title: "+title+"\n"+"Length: "+length.toString()+"\n"+"Parts: "+parts.toString();
  }
}