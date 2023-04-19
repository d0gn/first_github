import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int leftDice = 0;
  List<String> beastList = [
    "고양이",
    "백조",
    "부엉이",
    "새",
    "참새",
  ];
  String beastName = "새";
  void _incrementCounter() {
    setState(() {
      leftDice = Random().nextInt(beastList.length);
      _counter++;
      beastName = beastList[leftDice];
    });
  } // 버튼 누르면 counter++ 가 아니라 image가 생기게

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '오늘의 짐승',
            ),
            Text(
              beastName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(
                './image/$beastName.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '버튼',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
