class MechanicModel {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String image;

  MechanicModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.image,
  });

  factory MechanicModel.fromJson(Map<String, dynamic> json) {
    return MechanicModel(
      id: json['id'] as int? ?? 0,
      name: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': name,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }
}
