import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

import 'auth_credential_mock.dart';

class GoogleAuthProviderMock extends Mock implements GoogleAuthProvider {
  GoogleAuthProviderMock({this.accessToken, this.idToken});

  final String accessToken;
  final String idToken;

  AuthCredential getCredential({String accessToken, String idToken}) {
    final AuthCredential authCred = AuthCredentialMock(accessToken: accessToken, idToken: idToken);
    return authCred;
  }
}
