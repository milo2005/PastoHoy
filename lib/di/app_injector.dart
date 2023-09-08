import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@injectableInit
Future configureDependencies () => getIt.init();