import 'package:petapp/bloc/authentication/authenticaton_bloc.dart';
import 'package:petapp/custom_text_feild.dart';
import 'package:petapp/custom_scaffold_messager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final userEmailController = TextEditingController();
  final userNewPasswordController = TextEditingController();
  final userConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticatonBloc, AuthenticatonState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoadingState) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                );
              });
        } else if (state is ExceptionState) {
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.exception);
        } else if (state is ForgotPasswordSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, "/login");
        } else if (state is ForgotPasswordErrorState) {
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 80,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade400,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "Password",
                          style: GoogleFonts.stylish(
                            color: Colors.brown.shade600,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/logo.png",
                        width: 200,
                      ),
                      Center(
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.stylish(
                              color: Colors.brown,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        (state is InvalidEmailFormatState)
                            ? state.errorMessage
                            : (state is InvalidPasswordFormatState)
                                ? state.errorMessage
                                : "",
                        style: GoogleFonts.varelaRound(
                          color: Colors.red,
                        ),
                      ),
                      CustomTextField(
                        placeholder: "Email",
                        icon: Icons.person,
                        isObscure: false,
                        controller: userEmailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholder: "New Password",
                        icon: Icons.key,
                        isObscure: true,
                        controller: userNewPasswordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholder: "Confirm Password",
                        icon: Icons.key,
                        isObscure: true,
                        controller: userConfirmPasswordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.amber.shade400),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.brown,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticatonBloc>(context).add(
                          ForgotPasswordEvent(
                            email: userEmailController.text,
                            password: userNewPasswordController.text,
                           confirm: userConfirmPasswordController.text,
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.amber.shade400),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 168,
                        height: 60,
                        child: Center(
                          child: Text(
                            'Change Password',
                            style: GoogleFonts.stylish(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}