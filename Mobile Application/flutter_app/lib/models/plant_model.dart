class Plant {
  int? id;
  String? name;
  String? details;
  String? image;

  Plant({this.id, this.name, this.details, this.image});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['image'] = this.image;
    return data;
  }
}