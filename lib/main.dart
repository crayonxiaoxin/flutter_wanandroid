import 'package:flutter/material.dart';
import 'package:flutter_wan_android/net/request/home_article_request.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_cache/lx_cache.dart';
import 'package:lx_net/lx_net.dart';

void main() {
  runApp(const MyApp());
}

test() async {
  var request = HomeArticleRequest();
  request.pathParams = "0/json";
  try {
    var response = await LxNet.instance.request(request);
    print("main test $response");
    print("main test ${response['data']}");
  } catch (e) {
    print("main test $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends LxState<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    LxCache.preInit();
  }

  void _incrementCounter() {
    test();
    LxCache.instance.setString("hello", "value");
    String? value = LxCache.instance.get("hello");
    print("lx cache value: $value");
    setState(() {
      _counter++;
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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
