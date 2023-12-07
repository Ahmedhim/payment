class CustomerInputModel {
  final String name;
  final String email;

  CustomerInputModel({required this.name, required this.email});
  toJson() {
    return {
      "email": email,
      "name": name,
    };
  }
}
