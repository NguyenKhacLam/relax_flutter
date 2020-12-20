import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relax/src/bloc/song_bloc.dart';
import 'package:relax/src/models/song.dart';
import 'package:relax/src/utils/play_music.dart';
import 'package:relax/src/widget/dropdown_timer.dart';

class PlayMusicScreen extends StatefulWidget {
  final Song song;

  PlayMusicScreen({this.song});

  @override
  _PlayMusicScreensState createState() => _PlayMusicScreensState();
}

class _PlayMusicScreensState extends State<PlayMusicScreen> {
  bool isPLaying = true;
  PlayMusic playMusic = PlayMusic();

  togglePlaying() {
    if (isPLaying) {
      playMusic.pauseMusic();
      setState(() {
        isPLaying = false;
      });
    } else {
      playMusic.resumeMusic();
      setState(() {
        isPLaying = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(playMusic.hashCode);
    playMusic.playSongFromUrl(widget.song.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg_light_reverse.png'),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent.withOpacity(0),
                    elevation: 0,
                    title: Text(widget.song.name),
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.cloud_download_outlined),
                        onPressed: () => print('Download'),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Center(
                      child: GestureDetector(
                        onTap: togglePlaying,
                        child: Container(
                          height: 70,
                          width: 70,
                          child: CircleAvatar(
                            child: Icon(
                              isPLaying
                                  ? Icons.pause_outlined
                                  : Icons.play_arrow,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DropdownTimer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
