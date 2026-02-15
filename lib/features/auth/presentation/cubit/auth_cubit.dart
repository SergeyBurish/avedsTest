import 'package:aveds_test/features/auth/domain/entity/jwt_rt.dart';
import 'package:aveds_test/features/auth/domain/entity/user_profile.dart';
import 'package:aveds_test/features/auth/domain/usecase/auth_usecase.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_cubit.g.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthManager authManager;
  AuthCubit({required this.authManager}) : super(AuthState.initial());

  void onAuthPressed() {
    if (state.emailVerifying) {
      _confirmCode();
    } else {
      _getCode();
    }
  }

  Future<void> onRefresh() async {
    emit(state.copyWith(
      status: AuthStatus.inProgress,
      userId: '',
    ));
    final bool success = await _getUserData(returnLeftResult: true);
    if (!success) {
      _refreshCredentials();
    }
  }

  Future<void> _getCode() async {
    emit(state.copyWith.status(AuthStatus.inProgress));

    final result = await authManager.requestCode(state.email);

    result.fold(
      ifLeft: (Object failure) {
        emit(state.copyWith(
          status: AuthStatus.error,
          message: 'Fail to send verification code',
        ));
      },
      ifRight: (String message) {
        emit(state.copyWith(
          status: AuthStatus.codeRequestSuccess,
          codeSendEmail: state.email, // keep email verifying
          message: message,
        ));
      }
    );
  }

  Future<void> _confirmCode() async {
    emit(state.copyWith.status(AuthStatus.inProgress));

    final result = await authManager.confirmCode(state.email, state.code);

    result.fold(
      ifLeft: (Object failure) {
        emit(state.copyWith(
          status: AuthStatus.error,
          message: 'Fail to confirm code',
        ));
      },
      ifRight: (JwtRt jwtRt) {
        emit(state.copyWith(
          status: AuthStatus.codeConfirmSuccess,
          jwt: jwtRt.jwt,
          refreshToken: jwtRt.refreshToken,
        ));
        _getUserData();
      }
    );
  }

  Future<void> _refreshCredentials() async {
    emit(state.copyWith.status(AuthStatus.inProgress));

    final result = await authManager.refreshCredentials(state.refreshToken);

    result.fold(
      ifLeft: (Object failure) {
        emit(state.copyWith(
          status: AuthStatus.error,
          message: 'Fail to refresh credentials',
        ));
      },
      ifRight: (JwtRt jwtRt) {
        emit(state.copyWith(
          status: AuthStatus.codeConfirmSuccess,
          jwt: jwtRt.jwt,
          refreshToken: jwtRt.refreshToken,
        ));
        _getUserData();
      }
    );
  }

  Future<bool> _getUserData ({bool returnLeftResult = false}) async {
    emit(state.copyWith.status(AuthStatus.inProgress));
    final result = await authManager.getUserData(state.jwt);

    if (returnLeftResult && result.isLeft) {
      return false;
    }
    
    result.fold(
      ifLeft: (Object failure) {
        emit(state.copyWith(
          status: AuthStatus.error,
          message: 'Fail to get user data',
        ));
      },
      ifRight: (UserProfile userProfile) {
        emit(state.copyWith(
          status: AuthStatus.getUserDataSuccess,
          userId: userProfile.userId,
          message: 'User data fetched successfully',
        ));
      }
    );
    return true;
  }

  void onEmailChanged(String email) => 
    emit(state.copyWith.email(email));

  void onCodeChanged(String code) => 
    emit(state.copyWith.code(code));

  void logout() {
    emit(AuthState.initial());
  }
}
