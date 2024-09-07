class ApplicationDto {
  String? id;
  String? name;
  String? package;
  bool? status;
  String? childId;
  String? state;
  String? createdAt;

  ApplicationDto(
      {this.id,
        this.name,
        this.package,
        this.status,
        this.childId,
        this.state,
        this.createdAt});

  ApplicationDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    package = json['package'];
    status = json['status'];
    childId = json['childId'];
    state = json['state'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['package'] = this.package;
    data['status'] = this.status;
    data['childId'] = this.childId;
    data['state'] = this.state;
    data['createdAt'] = this.createdAt;
    return data;
  }
}