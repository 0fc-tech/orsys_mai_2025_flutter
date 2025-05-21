class Product {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
    );
  }

  String displayPrice() {
    return price.toStringAsFixed(2);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.title,
      'price': this.price,
      'description': this.description,
      'category': this.category,
      'image': this.image,
    };
  }
}
