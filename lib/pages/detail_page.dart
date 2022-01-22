import 'package:flutter/material.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("detail build");
    return WillPopScope(
      onWillPop: () async {
        MyRouterDelegate.of(context).pop(result: "test return value");
        return false;
      },
      child: Scaffold(
          appBar: ImmersiveAppBar(
            backgroundColor: Colors.blue,
            leading: BackButton(),
            child: Center(
              child: Text("details"),
            ),
          ),
          body: Center(
            child: Text("details"),
          )),
    );
  }
}
