class UpdateProfileRequestModel {
  String name;
  String email;
  String phone;
  String bio;
  String address;
  String website;
  String about;

  UpdateProfileRequestModel(
      {this.name,
      this.email,
      this.phone,
      this.bio,
      this.address,
      this.website,
      this.about});

  UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    address = json['address'];
    website = json['website'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['bio'] = this.bio;
    data['address'] = this.address;
    data['website'] = this.website;
    data['about'] = this.about;
    return data;
  }
}
