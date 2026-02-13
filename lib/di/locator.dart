import 'package:aveds_test/di/injector.dart';
import 'package:aveds_test/features/auth/domain/usecase/auth_usecase.dart';

class Locator {
  static AuthManager get authManager => getIt<AuthManager>();
}