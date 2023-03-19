import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
//import 'package:my_app/controllers/auth_controller.dart';
import 'package:my_app/views/screens/taikhoan/dangnhap.dart';
import 'package:my_app/views/widgets/taikhoan/taikhoandangnhap.dart';

class DangKy extends StatelessWidget {
  DangKy({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("TikTok Clone",
          style: TextStyle(
            fontSize: 35,
            color: buttonColor,
            fontWeight: FontWeight.w900,
            ),
          ),
          const Text('Đăng ký', 
          style: TextStyle(
            fontSize: 25,           
            fontWeight: FontWeight.w700,
            )
      ),
      const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () => taikhoanController.pickImage(),
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ],
            ),
      const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextInputField(
                controller: _usernameController,
                labelText: 'Tên đăng nhập',
                icon: Icons.person,
              ),
            ),
      const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
      const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextInputField(
                controller: _passwordController,
                labelText: 'Mật khẩu',
                icon: Icons.lock,
                isObscure:true,
              ),
            ),
      const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 55,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: InkWell(
                onTap: () => taikhoanController.taikhoandangky(
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                  taikhoanController.profilePhoto,
                ),
                child: const Center(
                  child:  Text('Đăng ký',
                  style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,),
                  ),
                ),
              ),
            ),
      const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Đã có tài khoản? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: ()  => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DangNhap(),
                    ),
                  ),
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 20, color: buttonColor),
                  ),
                ),
              ],
            ),
      ],))
    );
  }
}