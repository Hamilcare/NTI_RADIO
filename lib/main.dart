import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new ExampleApp()));
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => new _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  static final  String url_192 = "http://streaming.radionti.com/nti-hd.mp3";
  static final String url_128 = "http://streaming.radionti.com/nti-128.mp3";
  static final String url_320 = "http://streaming.radionti.com/nti-320.mp3";
  
  String currentUrl = url_192;
  Audio audio;
  bool _isPlaying = false;

  @override
  void dispose() {
    audio = null;
    super.dispose();
  }

  Audio fetchMusicPlayer() {
    return audio;
  }

  Widget audioPlayer(AudioPlayer player) {
    player.loadMedia(Uri.parse(currentUrl));

    return Center(
        child: ListTile(
      title: Icon(
        _isPlaying ? Icons.stop : Icons.play_arrow,
        size: 150,
        // color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_isPlaying) {
            player.pause();
          } else {
            player.play();
          }
          _isPlaying = !_isPlaying;
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Scaffold(
        body: Container(
            child: new Audio(
          audioUrl: currentUrl,
          playerBuilder:
              (BuildContext context, AudioPlayer player, Widget child) {
            return audioPlayer(player);
          },
        )),
      ),
    );
  }
}