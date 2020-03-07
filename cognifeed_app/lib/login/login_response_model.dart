class LoginResponseModel {
  int userId;
  String email;
  String name;
  String token;
  String imageUrl;

  LoginResponseModel({
    this.userId,
    this.email,
    this.name,
    this.token,
    this.imageUrl,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    name = json['name'];
    token = json['token'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['token'] = this.token;
    return data;
  }
}
