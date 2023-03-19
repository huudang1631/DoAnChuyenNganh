import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_app/views/screens/them_video.dart';
import 'package:my_app/views/screens/timkiem_screen.dart';
import 'package:my_app/views/screens/trangcanhan_screen.dart';
import 'package:my_app/views/screens/video_screen.dart';

import 'controllers/taikhoan_controller.dart';


List trang= [
  VideoScreen(),
  TimKiemScreen(),
  ThemVideo(),
  Text("Màn hình tin nhắn"),
  ProfileScreen(uid: taikhoanController.user.uid),

];
// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;



//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;


//CONTROLLER
var taikhoanController = TaiKhoanController.instance;