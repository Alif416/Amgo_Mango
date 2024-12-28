import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/features/shop/models/category_model.dart';
import 'package:myapp/utils/exceptions/firebase_exeptions.dart';
import 'package:myapp/utils/exceptions/platform_exceptions.dart';
import 'package:myapp/utils/helpers/firebase_storage_service.dart';


class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variables
  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    }  on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///upload categories to firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try{
      //upload all the categories along with their images
      final storage = Get.put(MFirebaseStorageService());

      //loop through each category
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        //upload image and get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        //assign url to category image attribute
        category.image = url;

        //store Category in firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }
}