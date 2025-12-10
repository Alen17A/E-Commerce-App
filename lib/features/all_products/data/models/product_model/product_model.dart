import 'package:json_annotation/json_annotation.dart';

import 'rating.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  int quantity;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromJsonMock(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: json['price'] == null
          ? null
          : double.tryParse(json['price']),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJsonMock() => <String, dynamic>{
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating,
    'quantity': quantity,
  };
}
