// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cookly/modules/auth/bloc/auth_cubit.dart' as _i642;
import 'package:cookly/modules/auth/presentation/widgets/bloc/registration_form_cubit.dart'
    as _i382;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i382.RegistrationFormCubit>(
        () => _i382.RegistrationFormCubit());
    gh.factory<_i642.AuthCubit>(() => _i642.AuthCubit());
    return this;
  }
}
