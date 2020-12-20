import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:relax/src/models/category.dart';
import 'package:relax/src/models/song.dart';

class FirestoreService{
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<List<Category>> getAllCategory()async{
    List<Category> list = [];
    QuerySnapshot snapshot = await _db.collection('categories').get();

    snapshot.docs.forEach((doc) {
      Category category = Category.fromMap(doc.data());
      list.add(category);
    });

    return list;
  }

  static Future<List<Song>> getAllSongsByCategory(String category) async{
    List<Song> list = [];

    QuerySnapshot snapshot = await _db.collection('songs').where('category', isEqualTo: category).get();

    snapshot.docs.forEach((doc) {
      Song song = Song.fromMap(doc.data());
      list.add(song);
    });

    print(list.length);

    return list;
  }
}