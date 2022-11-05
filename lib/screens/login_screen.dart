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

  @override
  void dispose() {
    // TODO: implement dispose
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
                child: Container(),
                flex: 3,
              ),
              //Logo
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                height: 64,
                color: primaryColor,
              ),
              const SizedBox(height: 64),
              //Text form field login
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Input you email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              //Text form field password
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Input password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              //Button login
              const SizedBox(
                height: 24,
              ),
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
                child: Container(),
                flex: 2,
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
