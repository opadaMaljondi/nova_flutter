abstract class AppEndpoints {
  // static const String baseUrl = "10.0.2.2:8000"; // For Emulator
  static const String baseUrl = "10.0.2.2:8000"; // For A34
  static const String apiVersion = "/api";

  //-------------------------------------------

  // Authentication Routes
  static const String getUser = "$apiVersion/users/personal-information";
  static const String refreshToken = "$apiVersion/users/personal-information";

////-------------------------------------------
}
