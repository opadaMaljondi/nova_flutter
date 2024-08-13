import 'package:real_state/core/translations/local_keys.g.dart';

enum OperationType {
  kyc(LocaleKeys.kyc, 'KYC'),
  deposit(LocaleKeys.deposit, 'DEPOSIT'),
  withdraw(LocaleKeys.withdraw, 'WITHDRAWAL'),
  transfer(LocaleKeys.transfer, 'TRANSFER'),
  changePassword(LocaleKeys.changePassword, 'CHANGE_PASSWORD'),
  createAccount(LocaleKeys.createAccount, 'CREATE_ACCOUNT'),
  addAccount(LocaleKeys.addAccount, 'ADD_ACCOUNT');

  const OperationType(this.name, this.key);

  final String name;
  final String key;

  String toJson() {
    return name;
  }

  static OperationType fromJson(String value) {
    if (value == createAccount.key) {
      return createAccount;
    }
    if (value == addAccount.key) {
      return addAccount;
    }
    if (value == deposit.key) {
      return deposit;
    }
    if (value == withdraw.key) {
      return withdraw;
    }
    if (value == transfer.key) {
      return transfer;
    }
    if (value == changePassword.key) {
      return changePassword;
    }
    return kyc;
  }

  List<String> getKeys() {
    if (name == LocaleKeys.createAccount) {
      return [
        'type',
        'name',
        'lastname',
        'password',
        'investor',
      ];
    }
    if (name == LocaleKeys.addAccount) {
      return [
        'type',
        'name',
        'lastname',
        'password',
        'investor',
      ];
    }
    if (name == LocaleKeys.deposit) {
      return [
        'login',
        'amount',
      ];
    }
    if (name == LocaleKeys.withdraw) {
      return [
        'login',
        'amount',
      ];
    }
    if (name == LocaleKeys.transfer) {
      return [
        'login',
        'amount',
        'loginTo',
      ];
    }
    if (name == LocaleKeys.changePassword) {
      return [
        'login',
        'type',
      ];
    }
    return [];
  }

  getPrimaryKey() {
    final keys = getKeys();
    if (keys.isEmpty) {
      return '';
    }
    return keys[0];
  }

  getSecondaryKey() {
    final keys = getKeys();
    if (keys.length < 2) {
      return '';
    }
    return keys[1];
  }

  getThirdKey() {
    final keys = getKeys();
    if (keys.length < 3) {
      return '';
    }
    return keys[2];
  }
}
