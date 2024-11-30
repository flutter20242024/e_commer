import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState());

  static ChatCubit get(context) => BlocProvider.of(context);

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  String currentUrl = "";

  // ! listen to audio player
  listenToAudioPlayer({adioUrl}) async {
    audioPlayer.onDurationChanged.listen((Duration duration) {
      emit(state.copyWith(totalDuration: duration));
    });

    audioPlayer.onPositionChanged.listen((Duration duration) {
      emit(state.copyWith(currentDuration: duration));
    });

    audioPlayer.onPlayerComplete.listen((event) {
      isPlaying = false;

      emit(state.copyWith(isPlaying: isPlaying, currentDuration: Duration()));
    });
  }

  //! paly audio
  playAudio(String url) async {
    currentUrl = url;
    if (isPlaying) {
      audioPlayer.pause();
      isPlaying = false;
      emit(state.copyWith(isPlaying: isPlaying));
    } else {
      audioPlayer.play(UrlSource(url));
      isPlaying = true;
      emit(state.copyWith(isPlaying: isPlaying));
    }
  }

// ! check cureen URL
  bool checkCurrentUrl(String url) {
    return currentUrl == url;
  }

  //! pause audio
  pauseAudio() async {
    audioPlayer.pause();
    isPlaying = false;
    emit(state.copyWith(isPlaying: isPlaying));
  }

  //! stop audio
  stopAudio() async {
    audioPlayer.stop();
    isPlaying = false;
    emit(state.copyWith(isPlaying: isPlaying));
  }

  //! seek audio
  seekAudio(Duration durationToSeek) async {
    audioPlayer.seek(durationToSeek);

    emit(state.copyWith(currentDuration: durationToSeek));
  }

  // ! ============================================================= video player
  YoutubePlayerController? controller;
  Future initYouTubePlayer({required String videoId}) async {
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );

    YoutubePlayer(
      controller: controller!,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
    );
  }
}
