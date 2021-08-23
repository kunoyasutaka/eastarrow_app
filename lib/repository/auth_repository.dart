import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:eastarrow_app/extension/string_extension.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// ログイン中のFirebaseUserを返す
  User? get signInUser => _auth.currentUser;

  bool get isSignedIn => _auth.currentUser != null;

  bool get isNotSignedIn => _auth.currentUser == null;

  /// [email]と[password]を使ってサインインする
  Future<UserCredential?> signIn(BuildContext context, String email, String password) async {
    if (email.isBlank()) {
      await showTextDialog(context, 'メールアドレスを入力してください');
      throw const FormatException('メールアドレスを入力してください');
    }
    if (password.isBlank()) {
      await showTextDialog(context, 'パスワードを入力してください');
      throw const FormatException('パスワードを入力してください');
    }
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      await showTextDialog(context, _convertErrorMessage(e.code));
      throw MyAuthException(
        e.code,
        _convertErrorMessage(e.code),
      );
    } catch (e) {
      await showTextDialog(context, _convertErrorMessage(e.toString()));
      Logger().e(_convertErrorMessage(e.toString()));
      return null;
    }
  }

  void signOut() {
    _auth.signOut();
  }

  /// [email]と[password]を使ってfirebaseAuthに登録し、認証メールを送信
  Future<UserCredential?> createUserWithEmail(BuildContext context,
      String email, String password,String passwordConfirm) async {
    if (email.isBlank()) {
      await showTextDialog(context, 'メールアドレスを入力してください');
      throw const FormatException('メールアドレスを入力してください');
    }
    if (password.isBlank()) {
      await showTextDialog(context, 'パスワードを入力してください');
      throw const FormatException('パスワードを入力してください');
    }
    if (password != passwordConfirm ) {
      await showTextDialog(context, 'パスワードが一致しません');
      throw const FormatException('パスワードが一致しません');
    }
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      await showTextDialog(context, _convertErrorMessage(e.code));
      throw MyAuthException(
        e.code,
        _convertErrorMessage(e.code),
      );
    } catch (e) {
      await showTextDialog(context, _convertErrorMessage(e.toString()));
      Logger().e(e.toString());
      return null;
    }
  }

  String _convertErrorMessage(String errorMassage) {
    switch (errorMassage) {
      case 'weak-password':
        return '安全なパスワードではありません';
      case 'email-already-in-use':
        return 'すでに使われているメールアドレスです';
      case 'invalid-email':
        return 'メールアドレスを正しい形式で入力してください';
      case 'operation-not-allowed':
        return '登録が許可されていません';
      case 'wrong-password':
        return 'パスワードが間違っています';
      case 'user-not-found':
        return 'ユーザーが見つかりません';
      case 'user-disabled':
        return 'ユーザーが無効です';
      default:
        return '不明なエラーです';
    }
  }
}

class MyAuthException implements Exception {
  MyAuthException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}
