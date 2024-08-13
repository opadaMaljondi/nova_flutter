abstract class AppEndpoints {
  // static const String baseUrl = "10.0.2.2:8000"; // For Emulator
  static const String baseUrl = "srv559380.hstgr.cloud"; // For A34
  static const String apiVersion = "/api";
  static const String loginWithTelegram = "http://$baseUrl/api/auth/telegram-login-page"; //?lang=en&isDarkMode=true
  static const String successWithTelegram = "http://$baseUrl/api/auth/telegram-auth";
  static const String sendMessageToAccountantManager = "https://wa.me/+905548064115";
  static const String sendMessageToSupport =
      "https://wa.me/+905548064115?text=Good evening sir\nIt happened that I faced this problem at APC Prime:\n";
  static const String sendMessageToMe = "https://wa.me/+963939754627?text=";

  //-------------------------------------------

  // Authentication Routes
  static const String getUser = "$apiVersion/users/personal-information";
  static const String logout = "$apiVersion/auth/logout-refresh";
  static const String refreshToken = "$apiVersion/auth/refresh";
  static const String sendCode = "$apiVersion/auth/request-sms-token";
  static const String verificationCode = "$apiVersion/auth/verify-sms-token";
  static const String verifyTheWhatsappOtpToken = "$apiVersion/auth/whatsapp-auth";
  static const String uploadIDCardImages = "$apiVersion/upload/id-cards";
  static const String createUserAddress = "$apiVersion/users/user-address";
  static const String editProfile = "$apiVersion/users/personal-information";
  static const String sendFcmToken = "$apiVersion/notifications/token";

  //-------------------------------------------

  // Clients Routes
  static const String accountManagers = "$apiVersion/account-managers";
  static const String getClients = "$apiVersion/users";
  static const String messages = "$apiVersion/messages";
  static const String activeClient = "$apiVersion/users/active";
  static const String inactiveClient = "$apiVersion/users/inactive";


  static const String createOperation = "$apiVersion/requests/pending";
  static const String getAccounts = "$apiVersion/accounts";
  static const String getPayments = "$apiVersion/payment-ways/user";
  static const String getNotifications = "$apiVersion/notifications";
  static const String getPendingTransactions = "$apiVersion/requests/pending";
  static const String getProcessedTransactions = "$apiVersion/requests/processed";
  static const String acceptTransaction = "$apiVersion/requests/processed/accept";
  static const String rejectTransaction = "$apiVersion/requests/processed/reject";

////-------------------------------------------
}
