import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import 'widgets/side_menu_view_body.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyUser = UserModel(
      accessToken: "dummy_token",
      refreshToken: "dummy_refresh",
      id: 1,
      username: "Programmer X",
      email: "pro.account@email.com",
      firstName: "Programmer",
      lastName: "X",
      gender: "male",
      image: "",
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SideMenuViewBody(user: dummyUser),
    );
  }
}
