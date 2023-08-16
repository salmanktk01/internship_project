class X509Subject {
  final String country;
  final String designation;
  final String locality;
  final String address;
  final String email;

  X509Subject({
    required this.country,
    required this.designation,
    required this.locality,
    required this.address,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'C': country,
      'O': designation,
      'L': locality,
      'ST': address,
      'E': email,
    };
  }
}
