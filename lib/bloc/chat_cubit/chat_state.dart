part of 'chat_cubit.dart';


 class ChatState {
    Duration? currentDuration;
  Duration? totalDuration;
  bool isPlaying;

  ChatState({this.currentDuration=const Duration(), this.totalDuration =const Duration(), this.isPlaying = false});


  // ! copy with
  ChatState copyWith({
    Duration? currentDuration,
    Duration? totalDuration,
    bool? isPlaying,
  }) {
    return ChatState(
      currentDuration: currentDuration ?? this.currentDuration,
      totalDuration: totalDuration ?? this.totalDuration,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
 }


