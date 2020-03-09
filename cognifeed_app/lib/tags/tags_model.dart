class TagArray {
  List<Tag> tags;

  TagArray({this.tags});

  TagArray.fromJson(Map<String, dynamic> json) {
    if (json['tags'] != null) {
      tags = new List<Tag>();
      json['tags'].forEach((v) {
        tags.add(new Tag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tag {
  String tagId;
  String tagName;

  Tag({this.tagId, this.tagName});

  Tag.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagName = json['tag_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag_id'] = this.tagId;
    data['tag_name'] = this.tagName;
    return data;
  }
}
