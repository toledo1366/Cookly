import 'package:cookly/core/di/locator.dart';
import 'package:cookly/modules/main_dashboard/bloc/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDashboardPage extends StatelessWidget {
  const MainDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainDashboardCubit>(
      create: (context) => locator.get<MainDashboardCubit>()..init(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu)
          ),
        ),
        body: BlocBuilder<MainDashboardCubit, MainDashboardState>(
          builder: (context, state) => state.maybeMap(
            orElse: () => const Text('xDDDDDDD'),
            postLoaded: (value) =>  Expanded(child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(child: ListView.builder(
                    itemCount: value.items.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.network(
                              value.items[index].link,
                              height: 150,
                              width: 150,
                            ),
                            Column(
                              children: [
                                Text(
                                  value.items[index].title,
                                  
                                ),
                                Text(
                                  value.items[index].description
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                ),
              ],
            ) ),
          ),
        ),
      ),
    );
  }
}