import 'package:exam_productive_5/assets/constants/colors.dart';
import 'package:exam_productive_5/assets/constants/icons.dart';
import 'package:exam_productive_5/core/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hide = false;
  bool disabled = true;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedBloc, AuthenticatedState>(
        builder: (context, state) {
      return Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Gap(67),
                  Center(
                    child: SvgPicture.asset(AppIcons.logo),
                  ),
                  const Gap(44),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: emailController,
                      onEditingComplete: () {
                        print("oneditWorked");
                        if(emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          disabled = false;
                          setState(() {
                          });
                        }
                      },

                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: appBarTextColor.withOpacity(0.6)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 13.5),
                          fillColor: textFieldColor,
                          filled: true,
                          border: null),
                    ),
                  ),
                  const Gap(16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: hide,
                      onEditingComplete: () {
                        if(emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          disabled = false;
                          setState(() {
                          });
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: appBarTextColor.withOpacity(0.6)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                hide = !hide;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 13.5),
                              child: SvgPicture.asset(
                                hide ? AppIcons.eyeOff : AppIcons.eyeOn,
                              ),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 13.5),
                          fillColor: textFieldColor,
                          filled: true,
                          border: null),
                    ),
                  ),
                  const Gap(12),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Text("Forgot password?",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  const Gap(26),
                  MyButton(
                    isDisabled: disabled,
                    onTap: () {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          context.read<AuthenticatedBloc>().add(
                                LoginUserAuth(
                                  emailText: emailController.text.trim(),
                                  passwordText: passwordController.text.trim(),
                                  onSuccess: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Successfully login'),
                                      ),
                                    );
                                    Navigator.of(context).pushNamed("/home");
                                  },
                                  onFailure: (String value) async {
                                    context.read<AuthenticatedBloc>().add(
                                          CreateUserAuth(
                                            emailText: emailController.text,
                                            passwordText:
                                                passwordController.text,
                                            onSuccess: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Successfully created'),
                                                ),
                                              );
                                              Navigator.of(context)
                                                  .pushNamed("/home");
                                            },
                                            onFailure: (value) {
                                              print(value);
                                            },
                                          ),
                                        );
                                  },
                                ),
                              );
                        }
                      },
                      title: "Login",
                 ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
