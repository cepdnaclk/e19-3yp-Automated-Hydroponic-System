class Plant {
  final String name;
  final String image;

  Plant({
    required this.name,
    required this.image,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      name: json['name'],
      image: json['image'], //use json words
    );
  }
}
