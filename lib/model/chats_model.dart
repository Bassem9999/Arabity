class ChatsModel{
  int? id;
  String? sendFrom;
  String? sendTo;
  String? recieverId;
  String? message;
  String? time;


  ChatsModel({
    this.id,
    this.sendFrom,
    this.sendTo,
    this.recieverId,
    this.message,
    this.time,
    });

    ChatsModel.fromJson(Map json){
    id = json['id'];
    sendFrom = json['sendFrom'];
    sendTo = json['sendTo'];
    recieverId = json['recieverId'];
    message = json['message'];
    time = json['time'];

    }

    Map toJson(){
      return {
        'id' : id,
        'sendFrom' : sendFrom,
        'sendTo' : sendTo,
        'recieverId' : recieverId,
        'message' : message,
        'time' : time,
        };
    }


}