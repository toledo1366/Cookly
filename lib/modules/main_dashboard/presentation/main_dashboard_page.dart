import 'package:cookly/core/di/locator.dart';
import 'package:cookly/modules/main_dashboard/bloc/main_dashboard_cubit.dart';
import 'package:cookly/modules/main_dashboard/presentation/widgets/posts_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDashboardPage extends StatelessWidget {
  const MainDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainDashboardCubit>(
      create: (context) => locator.get<MainDashboardCubit>()..init(),
      child: BlocBuilder<MainDashboardCubit, MainDashboardState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.lime[200],
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu)
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          ),
          body: state.maybeMap(
            orElse: () => const Text('Loading'),
            postLoaded: (value) => Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: value.items.length,
                  itemBuilder: (context, index) => PostsListItem(value.items[index])
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}