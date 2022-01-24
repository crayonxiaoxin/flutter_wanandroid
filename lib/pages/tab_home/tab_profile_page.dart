import 'package:flutter/material.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/utils/toast.dart';
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
      gradient: const LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.blueAccent],
      ),
      elevation: 2.0,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            children: [
              const Center(
                child: Text(
                  "Profile Page",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                child: InkWell(
                  onTap: () {
                    toast("敬请期待。。。");
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                right: 0,
                top: 0,
                bottom: 0,
              )
            ],
          ),
        );
      },
    );
  }
}
