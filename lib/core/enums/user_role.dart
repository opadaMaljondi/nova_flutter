enum UserRole {
  client('client'),
  office('office');

  const UserRole(this.value);

  final String value;

  String toJson() {
    return value;
  }

  static UserRole fromJson(String value) {
    if (value == 'office') {
      return office;
    }
    return client;
  }
}
