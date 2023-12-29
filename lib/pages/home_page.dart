import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // controller
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Delivery animation
          Text(
            'Delivery',
            style:
                GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Lottie.asset('lib/animations/Animation.json'),
          const SizedBox(height: 25),
          // Bookmark animation
          Text(
            'Bookmark',
            style:
                GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              if (bookmarked == false) {
                bookmarked = true;
                _controller.forward();
              } else {
                bookmarked = false;
                _controller.reverse();
              }
            },
            child: Lottie.asset(
              'lib/animations/Animation1.json',
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
