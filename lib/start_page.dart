

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/tic_tac_toe.svg',
              width: 160,
              height: 160,
              color: Colors.white,
             
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'TIC TAC TOE',
              style: myNewFontWhite,
            ),
            const SizedBox(
              height: 100,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()),);
              },
              child: Text('PLAY GAME', style: myNewFontWhite),
            )
          ],
        ),
      ),
    );
  }
}
