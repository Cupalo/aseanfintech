class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.date,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final String? date;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        date: json['date'],
        image: json['image'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        'name': name,
        'description': description,
        'price': price,
        'date': date,
        'image': image,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
