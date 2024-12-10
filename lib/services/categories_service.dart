import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nba_highlights/models/category_model.dart';

class CategoriesService {
  // Reference to the Firestore collection
  //this is the collection reference and the collection name is 'Categories'

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('Categories');

  // methode to get all the Categories
  Stream<List<Category>> getCategories() {
    //return the collection as a stream
    return _collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
