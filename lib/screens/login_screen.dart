import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //dispose() được gọi khi đối tượng State bị xóa vĩnh viễn.
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: Container(),
              ),

              //Logo
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                height: 64,
                color: primaryColor,
              ),
              const SizedBox(
                height: 64,
              ),

              //Tạo widget tại lên hình đại diện
              Stack(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  CircleAvatar(
                    radius: 64,
                    // ignore: prefer_const_constructors
                    backgroundImage: NetworkImage(
                      "https://123design.org/wp-content/uploads/2020/07/AOTHOITRANGLM0231-qoobee-say-hi-300x300.jpg",
                    ),
                  )
                ],
              ),

              /*
              *Login
              */
              //Text field input your email
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email123",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              //Text field input password
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),

              //Button login
              //InkWell dùng xử lý các sự kiện onTab,...
              InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text("You don't have an account?"),
                  ),
                  //GestureDetectorcung cấp nhiều điều khiển hơn như kéo, v.v. mặt khác, nó không bao gồm chạm hiệu ứng gợn sóng InkWell.
                  GestureDetector(
                    //Sự kiện onTap
                    onTap: (() {}),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Sign up.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}