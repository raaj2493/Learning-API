class usermodel {
  final int id;
  final String name;
  final String email;
  final int age;
  final String phone;

  usermodel({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.phone,
  });

  factory usermodel.fromJson(Map<String, dynamic> json) {
    return usermodel(
      id: json["id"] ?? 0,
      name: "${json["firstName"] ?? ""} ${json["lastName"] ?? ""}",
      email: json["email"] ?? "",
      age: json["age"] ?? 0,
      phone: json["phone"] ?? "",
    );
  }
}
