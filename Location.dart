//Location class för att tydligt dela upp koden
class Location{
  double latitude;
  double longitude;
  int radius; //radius för att möjliggöra triggers

  Location(double latitude, double longitude, int radius){ //denna constructor behövs för att skapa adventures i appen
    this.latitude = latitude;
    this.longitude = longitude;
    this.radius = radius;
  }

  Map<String, dynamic> toJson(){
    return{
      "latitude": latitude,
      "longitude": longitude,
      "radius": radius
    };
  }

  Location.fromJson(Map<String, dynamic> json) //denna constructor används för att skapa locations från json som kommer från databasen
    : latitude = json["latitude"],
      longitude = json["longitude"],
      radius = json["radius"];
      
  String toString(){
    return "lat: "+latitude.toString()+" long:"+longitude.toString()+" radius: "+radius.toString();
  }
}