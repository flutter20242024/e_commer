class ResponseLogin {
  bool? status;
  String? message;
  Data? data;

  ResponseLogin({this.status, this.message, this.data});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? role;
  Null deviceToken;
  int? status;
  String? profileImage;
  String? createdAt;

  User(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.role,
      this.deviceToken,
      this.status,
      this.profileImage,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    deviceToken = json['deviceToken'];
    status = json['status'];
    profileImage = json['profileImage'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['role'] = role;
    data['deviceToken'] = deviceToken;
    data['status'] = status;
    data['profileImage'] = profileImage;
    data['createdAt'] = createdAt;
    return data;
  }
}
