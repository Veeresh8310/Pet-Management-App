import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petapp/add_pets.dart';
import 'package:petapp/bloc/authentication/authenticaton_bloc.dart';
import 'package:petapp/bloc/home/home_bloc.dart';
import 'package:petapp/forgot_password.dart';
import 'package:petapp/home.dart';
import 'package:petapp/landing.dart';
import 'package:petapp/login.dart';
import 'package:petapp/profile_page.dart';
import 'package:petapp/register.dart';
import 'package:petapp/start_sereen.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/register":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthenticatonBloc(),
            child: const RegisterPage(),
          ),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthenticatonBloc(),
            child: const LoginPage(),
          ),
        );
      case "/landing":
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc(),
            child: const HomePage(),
          ),
        );
      case "/start":
        return MaterialPageRoute(builder: (context) => const StartScreen());
      case "/rescue":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => HomeBloc(),
                  child: const RescuePage(),
                ));
      case "/profile":
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      case "/forgot":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthenticatonBloc(),
                  child:const ForgotPasswordPage(),
                ));
    }
    return null;
  }
}
