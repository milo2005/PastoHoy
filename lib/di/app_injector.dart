import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/di/app_injector.config.dart';


final getIt = GetIt.instance;

@injectableInit
Future configureDependencies () async => getIt.init();