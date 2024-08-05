import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List _imageAssets = [
    "assets/lgo1.png",
    "assets/lgo2.png",
    "assets/lgo3.png"
  ];
  bool end = false;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage == 2) {
        end = true;
      } else if (_currentPage == 0) {
        end = false;
      }

      if (end == false) {
        _currentPage++;
      } else {
        _currentPage--;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Image.asset('assets/logo.png', width: 100),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 290,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 100,
                  child: Image.asset(
                    _imageAssets[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: _imageAssets.length,
              controller: _pageController,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.amber.shade400),
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
                  'Get Started',
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
    );
  }
}