abstract class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = 'https://flower.elevateegy.com/api/v1';

  //auth
  static const String login = '$baseUrl/auth/signin';
  static const String logout = '$baseUrl/auth/logout';
}
