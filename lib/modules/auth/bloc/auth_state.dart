part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState{
  const factory AuthState.created() = _Created;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.error(String errorMessage) = _Error; 
}