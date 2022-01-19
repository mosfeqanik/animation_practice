import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Animation Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _size = 50;
  Color _boxColor = Colors.green;
  double _boxOpacity = 1.0;
  bool _showBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _boxOpacity = _boxOpacity == 1.0 ? 0.0 : 1.0;
                });
              },
              icon: const Icon(Icons.opacity_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 10,),
            AnimatedOpacity(
              opacity: _showBox?1.0:0.0,
              duration: Duration(milliseconds: 1000),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                width: _showBox?100:200,
                height: _showBox?100:200,
                color: _showBox?Colors.orange:Colors.green,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showBox = !_showBox;
            //
            // _size = _size == 25 ? 50 : 25;
            // _boxColor =
            //     _boxColor == Colors.green ? Colors.orange : Colors.green;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
