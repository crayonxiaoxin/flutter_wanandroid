import 'package:flutter/material.dart';
import 'package:flutter_wan_android/net/request/home_article_request.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';
import 'package:lx_cache/lx_cache.dart';
import 'package:lx_net/lx_net.dart';

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
    // test();
    // LxCache.instance.setString("hello", "value");
    // String? value = LxCache.instance.get("hello");
    // print("lx cache value: $value");
    print("click");
    // setState(() {
    //   _counter++;
    // });
    MyRouterDelegate.of(context).push(MyRoutePath.details(),
        onPopResult: (res) {
      toast(res);
    });
    // Future.delayed(Duration(seconds: 2), () {
    //   MyRouterDelegate.of(context).push(MyRoutePath.details(), notify: true);
    // });
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const ImmersiveAppBar(
        backgroundColor: Colors.blue,
        elevation: 2,
        height: 0,
        child: Text(
          "data",
        ),
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
