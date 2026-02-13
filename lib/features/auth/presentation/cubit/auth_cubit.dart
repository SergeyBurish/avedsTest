import 'package:aveds_test/features/auth/domain/usecase/auth_usecase.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_cubit.g.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthManager authManager;
  AuthCubit({required this.authManager}) : super(AuthState.initial());

  void onGetCodePressed() async {
    final result = await authManager.requestCode(state.email);

    result.fold(
      ifLeft: (Object failure) {
        print('failure $failure');
      },
      ifRight: (_) {
        print('ifRight');
      }
    );
  }

  void onEmailChanged(String email) => 
    emit(state.copyWith.email(email));
}
