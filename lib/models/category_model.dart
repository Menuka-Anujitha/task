class Category {
  String title;
  String description;
  String image;

  Category({
    required this.title,
    required this.description,
    required this.image,
  });

  // Factory constructor to create a Categories from a Firestore document
  factory Category.fromJson(
    Map<String, dynamic> doc,
  ) {
    return Category(
      title: doc['title'],
      description: doc['description'],
      image: doc['image'],
    );
  }
}
