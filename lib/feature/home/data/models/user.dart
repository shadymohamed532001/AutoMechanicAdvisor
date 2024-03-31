class User {
  bool? status;
  String? message;
  Data? data;

  User({this.status, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;

    return data;
  }
}

class Data {
  String? fullName;
  String? email;
  String? address;
  String? phoneNumber;
  String? image;

  Data({this.fullName, this.email, this.address, this.phoneNumber, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
  }
}
