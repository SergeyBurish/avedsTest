// import 'package:aveds_test/features/auth/domain/usecase/auth_usecase.dart';
import 'package:aveds_test/features/auth/domain/usecase/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthManager authManager;
  AuthCubit({required this.authManager}) : super(AuthState.initial());

  void onGetCodePressed() async {
    final result = await authManager.requestCode('email');

    result.fold(
      ifLeft: (Object failure) {
        print('failure $failure');
      },
      ifRight: (_) {
        print('ifRight');
      }
    );
  }
}
