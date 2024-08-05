import 'package:flutter/widgets.dart';
import 'package:petapp/bloc/authentication/authenticaton_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petapp/custom_text_feild.dart';
import 'custom_scaffold_messager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userEmailIdController = TextEditingController();
  final userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticatonBloc, AuthenticatonState>(
      listener: (context, state) {
        if (state is LoadingState) {
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
        } else if (state is LoginFailedState) {
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        } else if (state is LoginSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, "/start");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade400,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height - 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/logo.png',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Sign In",
                        style: GoogleFonts.stylish(
                          color: Colors.brown,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text((state is InvalidEmailFormatState)
                          ? state.errorMessage
                          : (state is InvalidPasswordFormatState)
                              ? state.errorMessage
                              : ""),
                      CustomTextField(
                        placeholder: "Email",
                        icon: Icons.mail,
                        isObscure: false,
                        controller: userEmailIdController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholder: "Password",
                        icon: Icons.key,
                        isObscure: true,
                        controller: userPasswordController,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                       Align(
                        alignment:const Alignment(0.85, 0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/forgot');
                          },
                          child:const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.brown,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthenticatonBloc>(context).add(
                      LoginEvent(
                        userEmailId: userEmailIdController.text,
                        userPassword: userPasswordController.text,
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
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.stylish(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/register");
                  },
                  style: ButtonStyle(
                    surfaceTintColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    elevation: const WidgetStatePropertyAll(0),
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.amber.shade400, width: 3)),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Register',
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
          ),
        );
      },
    );
  }
}