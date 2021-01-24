class User {
  // String farmerName;
  // String address;
  // String phone;
  String email;
  String username;
  String password;

  User( this.email, this.username,
      this.password);

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
        json['email'], json['username'], json['password']);
  }

  // String toString() {
  //   return '${this.farmerName} โทรศัพท์: ${this.phone} ที่อยู่ ${this.address}';
  // }
}
