import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shapes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Number Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  bool _isSquare(int number){
    int aux = 0;
    while(aux <= number){
      if(aux*aux == number){
        return true;
      }
      aux++;
    }

    return false;
  }
  
  bool _isTriangle(int number){
    int aux = 0;
    int sum = 0;
    while(sum<=number){
      if(sum == number){
        return true;
      }
      sum = sum + aux;
      aux++;
    }
    
    return false;
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
            Text(
              'Please input a number to see if it is square or triangular:',
            ),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          int number = int.parse(myController.text);

          if(_isSquare(number) && _isTriangle(number)){
            return showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("$number"),
                  content: Text("Number $number is both SQUARE and TRIANGULAR."),
                );
              },
            );
          }
          else if(_isSquare(number)){
            return showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("$number"),
                  content: Text("Number $number is SQUARE."),
                );
              },
            );
          }
          else if(_isTriangle(number)){
            return showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("$number"),
                  content: Text("Number $number is TRIANGULAR."),
                );
              },
            );
          }
          else{
            return showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("$number"),
                  content: Text("Number $number is neither SQUARE and TRIANGULAR."),
                );
              },
            );
          }
        },
        tooltip: 'Check',
        child: Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
