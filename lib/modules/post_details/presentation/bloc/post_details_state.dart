part of 'post_details_cubit.dart';

@freezed
class PostDetailsState with _$PostDetailsState{
  const factory PostDetailsState.initialized() = _Initialized;
  const factory PostDetailsState.error(String errorMessage) = _Error;
  const factory PostDetailsState.published() = _Published;
}