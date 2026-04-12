abstract class AuthRepo {
Future<void> login(String email, String password);
Future<void> signUp(String name, String email, String password);
Future<void> logout();
}