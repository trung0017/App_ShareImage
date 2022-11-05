import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  //dispose() được gọi khi đối tượng State bị xóa vĩnh viễn.
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //padding: const EdgeInsets.symmetric(horizontal: 32),
          //width: double.infinity,
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Flexible(
                //   flex: 3,
                //   child: Container(),
                // ),

                //Logo
                SvgPicture.asset(
                  "assets/ic_instagram.svg",
                  height: 64,
                  color: primaryColor,
                ),
                const SizedBox(height: 30),

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
                    ),
                    Positioned(
                      //Chỉnh vị trí icon
                      bottom: -10,
                      left: 80,
                      //Chỉnh vị trí
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),

                //Text field input your username
                TextFieldInput(
                    textEditingController: _usernameController,
                    hintText: "Enter your username",
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 24,
                ),

                //Text field input your email
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: "Enter your email",
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 24,
                ),

                //Text field input password
                TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: "Enter your password",
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),

                //Text field input your bio
                TextFieldInput(
                    textEditingController: _bioController,
                    hintText: "Enter your bio",
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 24,
                ),

                //Button login
                //InkWell dùng xử lý các sự kiện onTab,...
                InkWell(
                  onTap: (() async {
                    String res = await AuthMethods().signUpUser(
                      email: _emailController.text,
                      password: _passwordController.text,
                      username: _usernameController.text,
                      bio: _bioController.text,
                    );
                    print(res);
                  }),
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
                // Flexible(
                //   flex: 2,
                //   child: Container(),
                // ),
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
                      onTap: () {},
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
      ),
    );
  }
}
//Lỗi xuất hiện màu vàng vì sử dụng flexible
