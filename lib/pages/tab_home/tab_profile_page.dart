import 'package:flutter/material.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends LxState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _buildImmersiveAppBar(),
      body: Container(
        child: Center(
          child: Text("ProfilePage"),
        ),
      ),
    );
  }

  ImmersiveAppBar _buildImmersiveAppBar() {
    return ImmersiveAppBar(
      height: 0,
    );
  }
}
