class LoginResponseModel {
  int userId;
  String email;
  String name;
  String phone;
  String bio;
  String imageUrl;
  String website;
  String about;
  String address;
  String token;
  String joinedDate;
  LoginResponseModel(
      {this.userId,
      this.email,
      this.name,
      this.phone,
      this.bio,
      this.imageUrl,
      this.website,
      this.about,
      this.joinedDate,
      this.address,
      this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    bio = json['bio'];
    imageUrl = json['image_url'];
    website = json['website'];
    about = json['about'];
    address = json['address'];
    token = json['token'];
    joinedDate = json['joined_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['bio'] = this.bio;
    data['image_url'] = this.imageUrl;
    data['website'] = this.website;
    data['about'] = this.about;
    data['address'] = this.address;
    data['token'] = this.token;
    data['joined_date'] = this.joinedDate;
    return data;
  }
}
