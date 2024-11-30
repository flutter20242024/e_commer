class MessageModel {
  final int id;
  final String message;
  final String time;
  final String senderName;
  final int typeSender;
  final int typeMessage; // 0 text , 1 image ,2 audio , 3 video

  MessageModel(
      {required this.id,
      required this.message,
       required this.typeMessage,
      required this.time,
      required this.senderName,
      required this.typeSender}); // 0 = sender, 1 = receiver
}

List<MessageModel> messages = [
  MessageModel(
      id: 1,
      message: "Hello guys Cap Henedy with you, welcome and nice to meet you",
      time: "09:00 AM",
      typeMessage: 0,
      senderName: "Cap Henedy",
      typeSender: 1),
  MessageModel(
      id: 2,
      message: "Hello guys Cap Henedy with you, welcome and nice to meet you",
      time: "09:00 AM",
      senderName: "Cap Henedy",
      
      typeSender: 1,
      
      typeMessage: 0,
      ),
  MessageModel(
      id: 3,
      message: "assets/images/pro2.jpg",
      time: "09:00 AM",
      senderName: "Cap Henedy",
      typeSender: 0,
      typeMessage: 1
      ),
  MessageModel(
      id: 4,
      message: "assets/images/pro4.jpg",
      time: "10:00 AM",
      senderName: "Cap Henedy",
      typeSender: 1,
      typeMessage: 1,),
  MessageModel(
      id: 5,
      message: "assets/images/cat2.jpeg",
      time: "09:00 AM",
      senderName: "Cap Henedy",
      typeMessage: 1,
      typeSender: 0),



        MessageModel(
      id: 4,
      message: "https://download.tvquran.com/download/TvQuran.com__Maher/001.mp3",
      time: "10:00 AM",
      senderName: "Cap Henedy",
      typeSender: 1,
      typeMessage: 2,),
  MessageModel(
      id: 5,
      message: "https://download.tvquran.com/download/TvQuran.com__Maher/103.mp3",
      time: "09:00 AM",
      senderName: "Cap Henedy",
      typeMessage: 2,
      typeSender: 0),



];
