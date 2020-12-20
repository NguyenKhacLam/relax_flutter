import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relax/src/models/song.dart';
import 'package:relax/src/pages/play_music_page.dart';

class SongBlock extends StatelessWidget {
  final Song song;

  SongBlock({this.song});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlayMusicScreen(song: song,))),
      child: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              image: DecorationImage(
                  image: NetworkImage(song.imageUrl), fit: BoxFit.cover),
            ),
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    song.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.play_arrow),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
