import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/controllers/taikhoan_controller.dart';
import 'package:my_app/views/screens/taikhoan/dangky.dart';
import 'package:my_app/views/widgets/taikhoan/taikhoandangnhap.dart';

class DangNhap extends StatelessWidget {
  DangNhap({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            fontSize: 40,
            color: buttonColor,
            fontWeight: FontWeight.w900,
            ),
          ),
          const Text('Đăng nhập', 
          style: TextStyle(
            fontSize: 25,           
            fontWeight: FontWeight.w700,
            )
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
                isObscure: true,
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
                onTap: () => taikhoanController.taikhoandangnhap(
                  _emailController.text,
                  _passwordController.text,
                ),
                child: const Center(
                  child:  Text('Đăng nhập',
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
                  'Chưa có tài khoản? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DangKy(),
                    ),
                  ),
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(fontSize: 20, color: buttonColor),
                  ),
                ),
              ],
            ),
      ],))
    );
  }
}