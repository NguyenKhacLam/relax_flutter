import 'dart:async';

import 'package:relax/src/base/base_bloc.dart';
import 'package:relax/src/models/song.dart';
import 'package:relax/src/repositories/firestore_service.dart';
import 'package:relax/src/utils/play_music.dart';

class SongBloc extends BaseBloc{
  StreamController<List<Song>> songsStreamController = StreamController<List<Song>>();
  StreamController<int> songStreamController = StreamController<int>();

  Stream<List<Song>> get songsStream => songsStreamController.stream;

  void getSongData(String category) async{
    List<Song> data = await FirestoreService.getAllSongsByCategory(category);
    print('Getting data');
    songsStreamController.sink.add(data);
  }

  @override
  void dispose() {
    super.dispose();
    songsStreamController.close();
    songStreamController.close();
  }
}