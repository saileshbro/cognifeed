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

  TagArray getSelectedTags() {
    List<Tag> selectedTags = [];
    this.tags.forEach((tag) {
      if (tag.isSelected) {
        selectedTags.add(tag);
      }
    });
    return TagArray(tags: selectedTags);
  }
}

class Tag {
  int tagId;
  String tagName;
  bool isSelected;

  Tag({this.tagId, this.tagName, this.isSelected});

  Tag.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagName = json['tag_name'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag_id'] = this.tagId;
    data['tag_name'] = this.tagName;
    data['is_selected'] = this.isSelected;
    return data;
  }
}
