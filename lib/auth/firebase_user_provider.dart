import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SalatiiFirebaseUser {
  SalatiiFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SalatiiFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SalatiiFirebaseUser> salatiiFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SalatiiFirebaseUser>(
        (user) => currentUser = SalatiiFirebaseUser(user));
