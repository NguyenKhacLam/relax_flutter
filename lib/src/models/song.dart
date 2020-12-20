class Song{
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final String songUrl;

  Song({this.id, this.name, this.category, this.imageUrl, this.songUrl});

  factory Song.fromMap(Map<String, dynamic> map){
    return Song(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      imageUrl: map['imageUrl'],
      songUrl: map['songUrl'],
    );
  }
}