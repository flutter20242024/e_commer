part of 'auth_cubit.dart';

class AuthState {
  // ! login
  final bool? loginState;
  final bool? editProfileState;
  final ResponseLogin? responseLogin;


  AuthState(
      {this.loginState = false,
      this.responseLogin,
      this.editProfileState = false,
   
      }) {
       
        }
}
