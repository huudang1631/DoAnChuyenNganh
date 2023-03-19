import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/models/user.dart' as model;
import 'package:my_app/views/screens/taikhoan/dangnhap.dart';
import 'package:my_app/views/screens/trangchu.dart';

import '../constants.dart';

class TaiKhoanController extends GetxController{


  static TaiKhoanController instance =Get.find();
   late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;


  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, setInitialScreen);
  }

  setInitialScreen(User? user) {
    if (user == null) {
     Get.offAll(() =>  DangNhap());
    } else {
      Get.offAll(() => const TrangChuScreen());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'Tải ảnh lên thành công');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }
   // tải lên firebase storage
  Future<String> uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }


  void taikhoandangky(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        
        String downloadUrl = await uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Lỗi đăng ký tài khoản',
          'Vui lòng điền đầy đủ thông tin',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Lỗi đăng ký tài khoản',
        e.toString(),
      );
    }
  }
  void  taikhoandangnhap (String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);         ;
      } else {
        Get.snackbar(
          'Lỗi đăng nhập!',
          'Vui lòng điền đày đủ thông tin!',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Lỗi đăng nhập!',
        e.toString(),
      );
    }
  }
   void signOut() async {
    await firebaseAuth.signOut();
  }

}