class SignupResponseModel {
  int userId;
  String email;
  String name;
  String token;
  String phone;
  String imageUrl;

  SignupResponseModel({this.userId, this.email, this.name, this.token});

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    name = json['name'];
    token = json['token'];
    phone = json['phone'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['token'] = this.token;
    data['phone'] = this.phone;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
