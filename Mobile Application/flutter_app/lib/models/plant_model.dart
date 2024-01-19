class Plant {
  late List<PlantModel> _plants;
  List<PlantModel> get plants => _plants;

  Plant({required plants}) {
    this._plants = plants;
  }

  Plant.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      _plants = (json['plants'] as List<dynamic>)
          .map((v) => PlantModel.fromJson(v))
          .toList();
    } else {
      _plants = [];
    }
  }
}


class PlantModel {
  int? id;
  String? name;
  String? details;
  String? image;

  PlantModel({required this.id, required this.name, required this.details, required this.image});

  PlantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['image'] = image;
    return data;
  }
}
