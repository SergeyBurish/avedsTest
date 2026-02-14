import 'package:aveds_test/features/auth/domain/usecase/auth_usecase.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_cubit.g.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthManager authManager;
  AuthCubit({required this.authManager}) : super(AuthState.initial());

  void onAuthPressed() async {
    if (state.emailVerifying) {
      _confirmCode();
    } else {
      _getCode();
    }
  }

  void _getCode() async {
    emit(state.copyWith.status(AuthStatus.inProgress));

    if (!EmailValidator.validate(state.email)) {
      emit(state.copyWith(
        status: AuthStatus.error,
        message: "Email isn't valid",
      ));
      return;
    }
    
    final result = await authManager.requestCode(state.email);

    result.fold(
      ifLeft: (Object failure) {
        emit(state.copyWith(
          status: AuthStatus.error,
          message: 'Fail to send verification code',
        ));
      },
      ifRight: (_) {
        emit(state.copyWith(
          status: AuthStatus.success,
          codeSendEmail: state.email, // keep email verifying
        ));
      }
    );
  }

  void _confirmCode() async {
    emit(state.copyWith.status(AuthStatus.inProgress));

    final result = await authManager.confirmCode(state.email, state.code);

    result.fold(
      ifLeft: (Object failure) {
        print('_confirmCode ifLeft');
      },
      ifRight: (_) {
        print('_confirmCode ifRight');
      }
    );
  }

  void onEmailChanged(String email) => 
    emit(state.copyWith.email(email));

  void onCodeChanged(String code) => 
    emit(state.copyWith.code(code));
}
