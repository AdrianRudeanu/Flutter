import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money convertor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Money Convertor'),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController myController = TextEditingController();
  double valEur;

  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network('https://cdn.pixabay.com/photo/2014/10/23/10/10/dollars-499481_1280.jpg'),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    validator: (String value) {
                      if (!_isNumeric(value)) {
                        return 'Nu este nr.';
                      }
                      return null;
                    },
                    controller: myController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'enter the ammount in EUR'),
                  ),
                ])),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    valEur = double.parse(myController.text) * 4.87;
                  });
                }
              },
              child: const Text('Convert'),
            ),
            Text('$valEur'),
          ],
        ),
      ),
    );
  }
}
