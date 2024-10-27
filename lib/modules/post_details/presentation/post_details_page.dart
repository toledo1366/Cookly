import 'package:cookly/core/di/locator.dart';
import 'package:cookly/modules/post_details/presentation/bloc/post_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostDetailsCubit>(
      create: (context) => locator.get<PostDetailsCubit>(),
      child: BlocConsumer<PostDetailsCubit, PostDetailsState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: Placeholder(),
        ),
      ),
    );
  }
}