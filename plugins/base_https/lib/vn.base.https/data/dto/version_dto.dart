class VersionDto {
  String? id;
  String? number;
  String? name;
  String? content;
  String? file;
  String? status;
  bool? isLast;

  VersionDto(
      {this.id,
        this.number,
        this.name,
        this.content,
        this.file,
        this.status,
        this.isLast});

  VersionDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    content = json['content'];
    file = json['file'];
    status = json['status'];
    isLast = json['isLast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
    data['content'] = this.content;
    data['file'] = this.file;
    data['status'] = this.status;
    data['isLast'] = this.isLast;
    return data;
  }
}