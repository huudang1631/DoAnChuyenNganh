import 'package:flutter/material.dart';
import 'package:my_app/controllers/timkiem_controller.dart';
import 'package:get/get.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/views/screens/trangcanhan_screen.dart';

class TimKiemScreen extends StatelessWidget {
  TimKiemScreen({Key? key}) : super(key: key);

  final TimKiemController timkiemController = Get.put(TimKiemController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            decoration: const InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onFieldSubmitted: (value) => timkiemController.searchUser(value),
          ),
        ),
        body: timkiemController.searchedUsers.isEmpty
            ? const Center(
                child: Text(
                  'Search for users!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: timkiemController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = timkiemController.searchedUsers[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          user.profilePhoto,
                        ),
                      ),
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}