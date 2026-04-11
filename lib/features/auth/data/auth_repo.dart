abstract class AuthRepo {
Future<void> login(String email, String password);
Future<void> signUp(String email, String password);
Future<void> logout();
}