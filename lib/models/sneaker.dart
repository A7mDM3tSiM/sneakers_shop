class Sneaker {
  final List<String> images;
  final String name;
  final String brand;
  final String price;
  final String description;
  final String color;
  final int colorCode;

  Sneaker({
    required this.images,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.color,
    required this.colorCode,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) {
    return Sneaker(
      images: List<String>.from(json['images']),
      name: json['name'],
      brand: json['brand'],
      price: json['price'],
      description: json['description'],
      color: json['color'],
      colorCode:
          int.parse(json['color_code'].substring(1), radix: 16) + 0xFF000000,
    );
  }
}
