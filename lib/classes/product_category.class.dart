class ProductCategoryC {
  int id;
  String name;
  String? description;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  ProductCategoryC(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory ProductCategoryC.fromJson(Map<String, dynamic> json) {
    return ProductCategoryC(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }
}
