// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:jokes_generator/providers/joke_provider.dart' as _i373;
import 'package:jokes_generator/services/dog_image_service.dart' as _i570;
import 'package:jokes_generator/services/joke_service.dart' as _i477;

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
    gh.factory<_i477.JokeService>(() => _i477.JokeService());
    gh.factory<_i570.DogImageService>(() => _i570.DogImageService());
    gh.factory<_i373.JokeProvider>(() => _i373.JokeProvider(
          gh<_i477.JokeService>(),
          gh<_i570.DogImageService>(),
        ));
    return this;
  }
}
