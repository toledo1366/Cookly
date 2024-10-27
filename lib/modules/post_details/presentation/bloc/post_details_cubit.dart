import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_details_state.dart';
part 'post_details_cubit.freezed.dart';

@injectable
class PostDetailsCubit extends Cubit<PostDetailsState>{
  PostDetailsCubit() : super(const PostDetailsState.initialized());
}