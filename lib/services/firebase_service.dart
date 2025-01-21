import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Fetch Skincare steps from the Firestore collection 'SkinCare'
  Stream<QuerySnapshot> getSkincareSteps() {
    return _firestore.collection('SkinCare').snapshots();
  }

  // Upload an image to Firebase Storage
  Future<String?> uploadImage(File imageFile, String fileName) async {
    try {
      // Create a reference to the Firebase Storage location
      Reference reference = _storage.ref().child('skincare_images/$fileName');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = reference.putFile(imageFile);

      // Get the URL of the uploaded image once the upload is complete
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  // Pick an image from the gallery or camera
  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
