part of 'main_dashboard_cubit.dart';

@freezed
class MainDashboardState with _$MainDashboardState{
  const factory MainDashboardState.initialized() = _Initialized;
  const factory MainDashboardState.loading() = _Loading;
  const factory MainDashboardState.postLoaded(List<Post> items) = _PostLoaded;
}