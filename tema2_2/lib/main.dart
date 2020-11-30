import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController myController = TextEditingController();

  bool _isVisible = false;
  int number = 0;
  String result = '';
  int numberToGuess = -1;
  String guessReset = 'Guess';

  void showText() {
    setState(() {
      if(guessReset == 'Guess'){
        if(numberToGuess == -1){
          Random rng = Random();
          numberToGuess = rng.nextInt(100);
        }else{
          number = int.parse(myController.text);
          _isVisible = true;
          if(number<numberToGuess){
            result = 'Try lower';
          }
          else if(number > numberToGuess){
            result = 'Try higher';
          }
          else{
            result = 'You did it!';
            guessReset = 'Reset';
          }
        }
      }
      else{
        _isVisible = false;
        guessReset = 'Guess';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'I am thinking of a number between 1 and 100.',
            ),
            const Text(
              "It's your turn to guess my number."
            ),
            Visibility(
              visible: _isVisible,
              child: Text('You tried $number \n $result'),
            ),
            Card(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Try a number!'),
                  TextField(
                    controller: myController,
                  ),
                  FlatButton(
                    onPressed: (){
                      showText();
                    },
                    child: Text(
                      '$guessReset'
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
