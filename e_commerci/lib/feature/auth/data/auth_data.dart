import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDate {
  final _supabase = Supabase.instance.client;

  Future<(bool success, String? error)> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return (true, null); 
      } else {
        return (false, "Unknown error occurred");
      }
    } on AuthException catch (e) {
      return (false, e.message); 
    } catch (e) {
      return (false, "Something went wrong");
    }
  }

  Future<(bool success, String? error)> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return (true, null); 
      } else {
        return (false, "Unknown error occurred");
      }
    } on AuthException catch (e) {
      return (false, e.message); 
    } catch (e) {
      return (false, "Something went wrong");
    }
  }

Future<(bool success, String? error)> resetEmail({
  required String email,
}) async {
  try {
    await _supabase.auth.resetPasswordForEmail(email);
    return (true, null); 
  } on AuthException catch (e) {
    return (false, e.message); 
  } catch (e) {
    return (false, "Something went wrong");
  }
}

Future<(bool success, String? error)> updatePassword(String newPassword,String email) async {
  try {
    await _supabase.auth.updateUser(
      UserAttributes(password: newPassword),
    );
    return (true, null);
  } on AuthException catch (e) {
    return (false, e.message);
  } catch (e) {
    return (false, "Something went wrong");
  }
}

  signOut()async{
    await _supabase.auth.signOut();
  }
}


