abstract class AppEndpoints {
  // static const String baseUrl = "10.0.2.2:8000"; // For Emulator
  static const String baseUrl = "10.0.2.2:8000"; // For A34
  static const String apiVersion = "/api";

  //-------------------------------------------

  // Authentication Routes
  static const String getUser = "$apiVersion/users/personal-information";
  static const String refreshToken = "$apiVersion/users/personal-information";

  // Companies Routes
  static const String getCompanies =
      "$apiVersion/user/companies?type=real_estate_companies";

  // News Routes
  static const String getNews = "$apiVersion/user/allNews";

  // Favorites
  static const String addFavorite = "$apiVersion/user/addFav/";
  static const String removeFavorite = "$apiVersion/user/addFav/";

  // Main
  static const String getNotifications = "$apiVersion/user/allNoti";
  static const String upgradeToBroker = "$apiVersion/user/promotionOrder";

  // Brokers
  static const String getBrokers = "$apiVersion/allUser/office/";

////-------------------------------------------
}
