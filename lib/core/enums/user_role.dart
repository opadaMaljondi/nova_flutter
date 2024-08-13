enum UserRole {
  user('User'),
  admin('Admin');

  const UserRole(this.value);

  final String value;

  String toJson() {
    return value;
  }

  static UserRole fromJson(String value) {
    if (value == 'Admin') {
      return admin;
    }
    return user;
  }
}
