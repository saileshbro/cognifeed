class ChangePassword {
  String newpw;
  String currentpw;
  String confirmpw;
  String vcode;
  ChangePassword({this.newpw, this.currentpw, this.confirmpw, this.vcode});

  ChangePassword.fromJson(Map<String, dynamic> json) {
    newpw = json['newpw'];
    currentpw = json['currentpw'];
    confirmpw = json['confirmpw'];
    vcode = json['vcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newpw'] = this.newpw;
    data['currentpw'] = this.currentpw;
    data['confirmpw'] = this.confirmpw;
    data['vcode'] = this.vcode;
    return data;
  }
}
