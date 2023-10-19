import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Tip Calculator',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tip Calculator'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange[200],
          elevation: 20,
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.white70,
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    '10%',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextFormField(
                    key: Key('billAmount'),
                    //controller: _billAmountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Bill Amount',
                      hintText: 'Enter the Bill Amount',
                      labelStyle: TextStyle(
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                      fillColor: Colors.purple[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(appState.current.asLowerCase),
                  ElevatedButton(
                    onPressed: () {
                      print('button pressed!');
                    },
                    child: Text('Enter'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
