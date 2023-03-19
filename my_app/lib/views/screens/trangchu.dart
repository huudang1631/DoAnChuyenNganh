import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/views/widgets/custom_icon.dart';

class TrangChuScreen extends StatefulWidget {
  const TrangChuScreen({Key? key}) : super(key: key);


   @override
  State<TrangChuScreen> createState() => TrangChuScrenState();
}

class TrangChuScrenState extends State<TrangChuScreen> {

  int index = 0;
  bool _isFollowingSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: Color.fromARGB(232, 234, 19, 19),
        unselectedItemColor: Color.fromRGBO(255, 255, 254, 1),
        onTap: (idx) {
          setState(() {
            index = idx;
          });
        },
        currentIndex: index,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 25,),
          label:"Trang chủ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 25,),
          label:"Tìm kiếm",
        ),
        BottomNavigationBarItem(
          icon: CustomIcon(),
          label:"",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message, size: 25,),
          label:"Hộp Thư",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 25,),
          label:"Tôi",
        ),       
      ]),
      body: trang[index],
    );
  }
  
 
}

