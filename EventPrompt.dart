import 'package:classes/Event.dart';

class EventPrompt extends Event{
  String message;
  String promptMessage;
  String correctAnswer;
  int wrongAnswerPath; //om användarens svar är correctAnswer följs superclassens path. Fel svar ger wrongAnswerPath

    //Standard constructor, mestadels för att göra det möjligt att skapa äventyr från appen senare
  EventPrompt(String message, String promptMessage, String correctAnswer, int wrongAnswerPath, int id, int path) 
    : this.message = message,
      this.promptMessage = promptMessage,
      this.correctAnswer = correctAnswer,
      this.wrongAnswerPath = wrongAnswerPath,
      super(id, "prompt", path);

  EventPrompt.fromJson(Map<String, dynamic> json)// den constructor som används när man läser in äventyr från databasen
    : message = json["message"],
      promptMessage = json["promptMessage"],
      correctAnswer = json["correctAnswer"],
      wrongAnswerPath = json["wrongAnswerPath"],
      super(json["id"], json["type"], json["path"]);

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "type": type,
      "message": message,
      "promptMessage": promptMessage,
      "correctAnswer": correctAnswer,
      "path": path,
      "wrongAnswerPath": wrongAnswerPath
    };
  }

  String toString(){
    return "\n  {\n    id: "+id.toString()+"\n" "    type: "+type+"\n" "    path: "+path.toString()+"\n" "    message: "+message+"\n"+
    "    promptMessage: "+promptMessage+"\n"+"    correctAnswer: "+correctAnswer+"\n"+"    wrongAnswerPath: "+wrongAnswerPath.toString()+"\n  }";
  }
}