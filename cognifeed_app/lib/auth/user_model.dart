class UserModel {
  int userId;
  String email;
  String name;
  String token;
  String imageUrl;
  String phone;
  String bio;
  String address;
  String website;
  String joinedDate;
  String about;

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    bio = json['bio'];
    imageUrl = json['image_url'];
    joinedDate = json['joined_date'];
    website = json['website'];
    about = json['about'];
    address = json['address'];
    token = json['token'];
  }

  UserModel({
    this.email,
    this.name,
    this.token,
    this.imageUrl,
    this.phone,
    this.bio,
    this.address,
    this.website,
    this.joinedDate,
    this.about,
  });

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
    data['joined_date'] = this.joinedDate;
    data['token'] = this.token;
    return data;
  }
}
