import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:masrophy_app/core/services/google_service.dart';

part 'login_with_google_state.dart';

class LoginWithGoogleCubit extends Cubit<LoginWithGoogleState> {
  LoginWithGoogleCubit() : super(LoginWithGoogleInitialState());

  final GoogleAuthService _googleAuthService = GoogleAuthService();

  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleLoadingState());

    try {
      final user = await _googleAuthService.signIn();

      emit(LoginWithGoogleSuccessState(user: user!));
    } catch (e) {
      emit(LoginWithGoogleFailureState(message: e.toString()));
    }
  }
}
