import 'dart:convert';

class ServiceCategory {
  final String name;
  final String imageUrl;

  ServiceCategory({
    required this.name,
    required this.imageUrl,
  });
}

class ServiceC {
  final String name;
  final String imageUrl;
  final String description;
  final String contact;
  final String location;
  final int rating;
  final ServiceCategory category;

  ServiceC({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.contact,
    required this.location,
    required this.rating,
    required this.category,
  });

  factory ServiceC.fromMap(Map<String, dynamic> map) {
    return ServiceC(
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      contact: map['contact'],
      location: map['location'],
      rating: map['rating'],
      category: ServiceCategory(name: map['category'], imageUrl: ''),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'contact': contact,
      'location': location,
      'rating': rating,
      'category': category.name,
    };
  }

  factory ServiceC.fromJson(String source) =>
      ServiceC.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
