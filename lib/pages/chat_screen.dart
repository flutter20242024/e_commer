import 'package:e_commerce/bloc/chat_cubit/chat_cubit.dart';
import 'package:e_commerce/chat/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messagController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              "assets/icons/back.svg",
              height: 24,
              width: 24,
            ),
          ),
          title: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/cat2.jpeg",
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "Across Desert G1",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            )
          ]),
          actions: [
            SizedBox(
              width: 30,
            ),
            MaterialButton(
              minWidth: 0,
              height: 0,
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: SvgPicture.asset("assets/icons/vedio.svg"),
            ),
            MaterialButton(
              minWidth: 0,
              height: 0,
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: SvgPicture.asset("assets/icons/call.svg"),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: _messagController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(.5)),
                    hintText: "Type a message",
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                _sendMessage();
              },
              icon: Icon(
                Icons.send,
                color: Colors.blue,
                size: 35,
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
          controller: scrollController,
          itemCount: messages.length,
          padding: EdgeInsets.only(bottom: 100, left: 20, right: 20),
          itemBuilder: (context, index) {
            MessageModel messageModel = messages[index];

            return getItemMessge(messageModel);
          }),
    );
  }

  Widget getItemMessge(MessageModel message) {
    switch (message.typeMessage) {
      case 0: // ! text message
        return Container(
          child: Row(
            mainAxisAlignment: message.typeSender == 0
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: message.typeSender == 0 ? Colors.black : Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: message.typeSender == 0
                        ? Radius.circular(0)
                        : Radius.circular(25),
                    topLeft: message.typeSender == 1
                        ? Radius.circular(0)
                        : Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.senderName,
                      style: TextStyle(
                          color: message.typeSender == 0
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        message.message,
                        style: TextStyle(
                            color: message.typeSender == 0
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );

      case 1: //! image
        return Container(
          child: Row(
            mainAxisAlignment: message.typeSender == 0
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: message.typeSender == 0
                        ? Radius.circular(0)
                        : Radius.circular(25),
                    topLeft: message.typeSender == 1
                        ? Radius.circular(0)
                        : Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.senderName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        message.message,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );

      case 2: // ! message sound

        ChatCubit.get(context).listenToAudioPlayer(adioUrl: message.message);
        return BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return Container(
              child: Row(
                mainAxisAlignment: message.typeSender == 0
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: message.typeSender == 0
                            ? Radius.circular(0)
                            : Radius.circular(25),
                        topLeft: message.typeSender == 1
                            ? Radius.circular(0)
                            : Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                ChatCubit.get(context)
                                    .playAudio(message.message);
                              },
                              icon: Icon(
                                state.isPlaying &&
                                        ChatCubit.get(context)
                                            .checkCurrentUrl(message.message)
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 35,
                              ),
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Slider(
                                  activeColor: Colors.black,
                                  value: ChatCubit.get(context)
                                          .checkCurrentUrl(message.message)
                                      ? state.currentDuration!.inSeconds
                                          .toDouble()
                                      : 0.0,
                                  min: 0.0,
                                  max: ChatCubit.get(context)
                                          .checkCurrentUrl(message.message)
                                      ? state.totalDuration!.inSeconds
                                          .toDouble()
                                      : 0.0,
                                  onChanged: (value) {
                                    ChatCubit.get(context).seekAudio(
                                        Duration(seconds: value.toInt()));
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );

      case 3: // ! video message

        ChatCubit.get(context).initYouTubePlayer(videoId: message.message);
        return BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return Container(
              child: Row(
                mainAxisAlignment: message.typeSender == 0
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 300,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: message.typeSender == 0
                              ? Radius.circular(0)
                              : Radius.circular(25),
                          topLeft: message.typeSender == 1
                              ? Radius.circular(0)
                              : Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: ChatCubit.get(context).controller!,
                          ),
                          builder: (context, player) {
                            return Column(
                              children: [
                                // some widgets
                                player,
                                //some other widgets
                              ],
                            );
                          }))
                ],
              ),
            );
          },
        );

      default:
        return Container();
    }
  }

  _sendMessage() {
    if (_messagController.text.isNotEmpty) {
      messages.add(
        MessageModel(
            id: 1,
            message: _messagController.text,
            time: "09:00 AM",
            typeMessage: 0,
            senderName: "Cap Henedy",
            typeSender: 0),
      );

      _messagController.clear();
      _scrollToBottom();
      setState(() {});
    }
  }

  void _scrollToBottom() {
    if (scrollController.hasClients) {
      // scrollToBottom.value = true;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
      // scrollToBottom.value = false;
      // debugPrint("scroll controller ");
    } else {
      // debugPrint("scroll controller  ERROR");
    }
  }
}
