import 'package:cartella/core/constants/auth_constants.dart';
import 'package:cartella/features/auth/logic/cubit/auth_cubit.dart';
import 'package:cartella/features/auth/ui/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/helper/extensions.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/routing/routes.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/custom_text_button.dart';
import 'package:cartella/core/widgets/custom_text_form_field.dart';

class AuthScreen extends StatefulWidget {
  final AuthType type;

  const AuthScreen({super.key, required this.type});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final isLogin = widget.type == AuthType.login;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushReplacementNamed(Routes.appBottomNavBar);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
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
                        if (!isLogin)
                          CustomTextFormField(
                            labelText: "Name",
                            controller: nameController,
                            validator: AppValidator.name,
                          ),
                        CustomTextFormField(
                          labelText: "Email",
                          controller: emailController,
                          validator: AppValidator.email,
                        ),
                        CustomTextFormField(
                          labelText: "Password",
                          isObscureText: isObsecure,
                          controller: passwordController,
                          validator: AppValidator.password,
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
                        InkWell(
                          onTap: () {
                            if (!isLogin) {
                              context.pushReplacementNamed(
                                Routes.authScreen,
                                arguments: isLogin ? AuthType.signup : AuthType.login,
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                isLogin
                                    ? "Don't have an account? Sign Up"
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
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;

                            return CustomTextButton(
                              buttonText: isLoading
                                  ? "loading...."
                                  : (isLogin ? "LOGIN" : "SIGN UP"),
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        if (isLogin) {
                                          cubit.login(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                        } else {
                                          cubit.signUp(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                        }
                                      }
                                    },
                            );
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
      ),
    );
  }
}
