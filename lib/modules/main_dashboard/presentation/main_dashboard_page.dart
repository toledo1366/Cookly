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
      child: BlocBuilder<MainDashboardCubit, MainDashboardState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.lime[200],
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu)
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
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                        ),
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          children: [
                            Image.network(
                              value.items[index].link,
                              height: 75,
                              width: 75,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    value.items[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    value.items[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                    ),
                  ),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}