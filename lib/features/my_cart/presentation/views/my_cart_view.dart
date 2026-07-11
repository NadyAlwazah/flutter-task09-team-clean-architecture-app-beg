import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key, required Null Function() onBackToHome});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyCartViewBody());
  }
}
