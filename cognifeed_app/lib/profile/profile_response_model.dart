class ProfileResponseModel {
  String name;
  String email;
  String phone;
  String bio;
  String about;
  String website;
  String imageUrl;
  String address;

  String joinedDate;

  ProfileResponseModel(
      {this.name,
      this.email,
      this.phone,
      this.bio,
      this.about,
      this.website,
      this.address,
      this.imageUrl,
      this.joinedDate});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    about = json['about'];
    website = json['website'];
    imageUrl = json['image_url'];
    address = json['address'];
    joinedDate = json['joined_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['bio'] = this.bio;
    data['about'] = this.about;
    data['website'] = this.website;
    data['address'] = this.address;
    data['image_url'] = this.imageUrl;
    data['joined_date'] = this.joinedDate;
    return data;
  }
}
