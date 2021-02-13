import 'package:get_it/get_it.dart';
import 'package:otp_firebase/views/router.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
}