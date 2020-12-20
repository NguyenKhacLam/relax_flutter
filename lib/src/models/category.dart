class Category{
  final String id;
  final String name;
  final String imageUrl;
  final String icon;
  final String color;
  final String description;

  Category({this.id, this.name, this.imageUrl, this.icon, this.color, this.description});

  factory Category.fromMap(Map<String, dynamic> doc){
    return Category(
        id: doc['id'],
        name: doc['name'],
        imageUrl: doc['imageUrl'],
        icon: doc['icon'],
        color: doc['color'],
        description: doc['description'],
    );
  }
}