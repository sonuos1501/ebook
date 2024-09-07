class LinkDto {
  String? id;
  String? link;
  bool? status;
  String? childId;
  String? createdAt;

  LinkDto(
      {this.id,
        this.link,
        this.status,
        this.childId,
        this.createdAt});

  LinkDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    status = json['status'];
    childId = json['childId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['status'] = this.status;
    data['childId'] = this.childId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}