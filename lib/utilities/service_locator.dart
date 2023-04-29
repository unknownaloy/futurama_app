import 'package:futurama_app/repositories/api_services.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.instance;

void setupLocator() {
  /// SERVICES
  locator.registerLazySingleton<ApiServices>(
    () => ApiServices(
      client: http.Client(),
    ),
  );
}
