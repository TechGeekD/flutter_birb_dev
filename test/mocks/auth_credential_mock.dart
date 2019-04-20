import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class AuthCredentialMock extends Mock implements AuthCredential {
  AuthCredentialMock({this.accessToken, this.idToken});

  final String accessToken;
  final String idToken;

  String get provider => '$idToken';

  String get data => '$accessToken';
}
