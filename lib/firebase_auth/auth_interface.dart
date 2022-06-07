

abstract class AuthInterface {
  Future login(String email, String pass);

  Future register(String email, String pass);

  Future logout();
}
