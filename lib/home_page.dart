import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTorn = true; //the first Player is o!
  List<String> displey_o_x = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;
  
  static var myNewFontWhite=GoogleFonts.pressStart2p(textStyle:TextStyle(color:Colors.white,letterSpacing:3,fontSize: 15));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: Container(
            //  color: Color(0xff9FA09E),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player O', style: myNewFontWhite),
                          const SizedBox(height: 10,),
                          Text(ohScore.toString(), style:myNewFontWhite),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player X', style:myNewFontWhite),
                          const SizedBox(height: 10,),
                          Text(exScore.toString(), style:myNewFontWhite),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff9FA09E)),
                      ),
                      child: Center(
                          child: Text(displey_o_x[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40))),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              //color: Color(0xff9FA09E),
              child: Center(
                child: Text('TIC TAC TOE',style:myNewFontWhite),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTorn && displey_o_x[index] == '') {
        displey_o_x[index] = 'o';
        filledBoxes += 1;
      } else if (!ohTorn && displey_o_x[index] == '') {
        displey_o_x[index] = 'x';
        filledBoxes += 1;
      }
      ohTorn = !ohTorn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displey_o_x[0] == displey_o_x[1] &&
        displey_o_x[0] == displey_o_x[2] &&
        displey_o_x[0] != "") {
      _showWinDialog(displey_o_x[0]);
    }
    if (displey_o_x[3] == displey_o_x[4] &&
        displey_o_x[3] == displey_o_x[5] &&
        displey_o_x[3] != "") {
      _showWinDialog(displey_o_x[3]);
    }
    if (displey_o_x[6] == displey_o_x[7] &&
        displey_o_x[6] == displey_o_x[8] &&
        displey_o_x[6] != "") {
      _showWinDialog(displey_o_x[6]);
    }
    if (displey_o_x[0] == displey_o_x[3] &&
        displey_o_x[0] == displey_o_x[6] &&
        displey_o_x[0] != "") {
      _showWinDialog(displey_o_x[0]);
    }
    if (displey_o_x[1] == displey_o_x[4] &&
        displey_o_x[1] == displey_o_x[7] &&
        displey_o_x[1] != "") {
      _showWinDialog(displey_o_x[1]);
    }
    if (displey_o_x[2] == displey_o_x[5] &&
        displey_o_x[2] == displey_o_x[8] &&
        displey_o_x[2] != "") {
      _showWinDialog(displey_o_x[2]);
    }
    if (displey_o_x[6] == displey_o_x[4] &&
        displey_o_x[6] == displey_o_x[2] &&
        displey_o_x[6] != "") {
      _showWinDialog(displey_o_x[6]);
    }
    if (displey_o_x[0] == displey_o_x[4] &&
        displey_o_x[0] == displey_o_x[8] &&
        displey_o_x[0] != "") {
      _showWinDialog(displey_o_x[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          title: Text('DRAW '),
          actions: [
            OutlinedButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again!')),
          ],
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          title: Text('WINNER ' + "" + winner),
          actions: [
            OutlinedButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again!')),
          ],
        );
      },
    );
    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displey_o_x[i] = '';
      }
    });
    filledBoxes=0;
  }
}
