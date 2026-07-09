import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/details/presentation/views/widgets/details_view_body.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/manager/product_cubit/product_cubit.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCubit()..getProductById(id),
        child: DetailsViewBody(id: id),
      ),
    );
  }
}
