import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_mplayer/models/music_model.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicModel music;
  const MusicPlayerScreen({super.key, required this.music});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audio;
  bool isPLaying = false;

  @override
  void initState() {
    super.initState();
    _audio = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.music.url;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.music.title),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              if (isPLaying) {
                _audio.pause();
                setState(() {
                  isPLaying = false;
                });
              } else {
                _audio.play(UrlSource(url));
                setState(() {
                  isPLaying = true;
                });
              }
            },
            iconSize: 50,
          ),
        ])));
  }
}
