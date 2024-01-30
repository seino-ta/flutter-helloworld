import 'package:flutter/material.dart';

// 1. エントリーポイントのmain関数
void main() {
  // 2. MyAppを呼び出す
  print("Call run App");
  runApp(const MyApp());
}

// MyAppのクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 3. タイトルとテーマを設定する。画面の本体はMyHomePageで作る
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

  // _MyHomePageStateを利用する
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _type = "偶数";
  void _incrementCounter() {
    print("Count up");
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _type = "偶数";
      } else {
        _type = "奇数";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ]),
      ),
      body: Column(
        children: [
          const Text("HelloWorld"),
          const Text("ハローワールド"),
          TextButton(
            onPressed: () => {print("ボタンが押されたよ")},
            child: const Text("テキストボタン"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 24.0,
                ),
                Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 30.0,
                ),
                Icon(
                  Icons.beach_access,
                  color: Colors.grey,
                  size: 36.0,
                ),
                Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                  size: 36.0,
                ),
              ]),
        
           const Text(
             'You have pushed the button this many times:',
           ),
           Text(
             '$_counter',
             style: Theme.of(context).textTheme.headlineMedium,
           ),
           if (_counter % 2 == 0)
             const Text('偶数です', style: TextStyle(fontSize: 20, color: Colors.red)),
             
        ],
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: _incrementCounter,
       tooltip: 'Increment',
       child: const Icon(Icons.add),
     ), 
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),
    );
  }
}
