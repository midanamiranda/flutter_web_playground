import 'package:complete_web_course/constants/controllers.dart';
import 'package:complete_web_course/constants/style.dart';
import 'package:complete_web_course/routing/routes.dart';
import 'package:complete_web_course/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48)
                    ),
                    child: Image.asset(
                      "assets/icons/logo.png",
                      width: 48,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Login",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Welcome back to the admin panel.",
                    color: lightGrey,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "abc@domain.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "123",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value){}),
                      const CustomText(text: "Remeber Me",),
                    ],
                  ),

                  CustomText(
                      text: "Forgot password?",
                      color: active
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.offAllNamed(rootRoute);
                },
                child: Container(
                  decoration: BoxDecoration(color: active,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const CustomText(
                    text: "Login",
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () async {
                  var result = await authController.signInWithGoogle();
                  bool success = result['success'];

                  if (!success) {
                    print("ERROR: ${result['message']}");
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result['message']),));
                  } else {
                    Get.offAllNamed(rootRoute);
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),

              RichText(text: TextSpan(
                  children: [
                    const TextSpan(text: "Do not have admin credentials? "),
                    TextSpan(text: "Request Credentials! ", style: TextStyle(color: active))
                  ]
              ))
            ],
          ),
        ),
      ),
    );
  }
}
