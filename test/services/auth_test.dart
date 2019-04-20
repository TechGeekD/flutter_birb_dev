import 'package:flutter_birb/services//auth.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks/auth_credential_mock.dart';
import '../mocks/firebase_auth_mock..dart';
import '../mocks/firebase_user_mock.dart';
import '../mocks/google_auth_provider_mock.dart';
import '../mocks/google_sign_in_account_mock.dart';
import '../mocks/google_sign_in_authentication_mock.dart';
import '../mocks/google_sign_in_mock.dart';

void main() {
  group('Auth', () {
    final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock();
    final GoogleSignInMock googleSignInMock = GoogleSignInMock();
    final FirebaseUserMock firebaseUserMock = FirebaseUserMock();
    final GoogleAuthProviderMock googleAuthProvider = GoogleAuthProviderMock();
    final GoogleSignInAccountMock googleSignInAccountMock =
        GoogleSignInAccountMock();
    final GoogleSignInAuthenticationMock googleSignInAuthenticationMock =
        GoogleSignInAuthenticationMock();
    final AuthCredentialMock authCredentialMock = AuthCredentialMock();
    final Auth auth = Auth(
      firebaseAuth: firebaseAuthMock,
      googleSignIn: googleSignInMock,
    );

    test('signInWithGoogle returns a user', () async {
      when(googleSignInMock.signIn()).thenAnswer((_) =>
          Future<GoogleSignInAccountMock>.value(googleSignInAccountMock));

      when(googleSignInAccountMock.authentication).thenAnswer((_) =>
          Future<GoogleSignInAuthenticationMock>.value(
              googleSignInAuthenticationMock));

//      when(googleAuthProvider.getCredential(
//        accessToken: googleSignInAuthenticationMock.accessToken,
//        idToken: googleSignInAuthenticationMock.idToken,
//      )).thenAnswer((_) => authCredentialMock);

      when(firebaseAuthMock.signInWithCredential(authCredentialMock))
          .thenAnswer((_) => Future<FirebaseUserMock>.value(firebaseUserMock));

      expect(await auth.signInWithGoogle(), firebaseUserMock);

      verify(googleSignInMock.signIn()).called(1);
      verify(googleSignInAccountMock.authentication).called(1);
      verify(googleAuthProvider.getCredential(
        accessToken: googleSignInAuthenticationMock.accessToken,
        idToken: googleSignInAuthenticationMock.idToken,
      )).called(1);
      verify(firebaseAuthMock.signInWithCredential(authCredentialMock))
          .called(1);
    });
  });
}
