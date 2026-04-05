import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/helper/extensions.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/routing/routes.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/custom_text_button.dart';
import 'package:cartella/core/widgets/custom_text_form_field.dart';

enum AuthType { login, signup }

class AuthScreen extends StatefulWidget {
  final AuthType type;

  const AuthScreen({super.key, required this.type});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final isLogin = widget.type == AuthType.login;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsManager.whiteBackground,
      ),
      backgroundColor: ColorsManager.whiteBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(20),
                Text(
                  isLogin ? "Login" : "Sign Up",
                  style: TextStyles.font34myBlack700W,
                ),
                verticalSpacing(80),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if (!isLogin) CustomTextFormField(labelText: "Name"),
                      CustomTextFormField(labelText: "Email"),
                      CustomTextFormField(
                        labelText: "Password",
                        isObscureText: isObsecure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon: Icon(
                            isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),

                      /// Forget / Switch
                      InkWell(
                        onTap: () {
                          if (!isLogin) {
                            context.pushNamed(
                              Routes.loginScreen,
                            ); // forgot password logic
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              isLogin
                                  ? "Forgot your password?"
                                  : "Already have an account?",
                              style: TextStyles.font14Black500W,
                            ),
                            horizentalSpacing(5),
                            SizedBox(
                              height: 18.h,
                              width: 18.w,
                              child: Image.asset(
                                "assets/images/arrow_right_login.png",
                              ),
                            ),
                          ],
                        ),
                      ),

                      verticalSpacing(100),

                      /// Button
                      CustomTextButton(
                        buttonText: isLogin ? "LOGIN" : "SIGN UP",
                        onPressed: () {
                          if (isLogin) {
                            context.pushReplacementNamed(
                              Routes.appBottomNavBar,
                            );
                          } else {
                            // sign up logic
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
