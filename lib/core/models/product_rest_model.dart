import 'package:json_annotation/json_annotation.dart';

part 'product_rest_model.g.dart';

@JsonSerializable()
class ProductRestModel {
  String name;
  String description;
  double price;
  double? discountPrice;
  bool isHotSale;
  String image;
  String category;

  ProductRestModel(
      {required this.name,
        required this.description,
        required this.price,
         this.discountPrice,
         required this.isHotSale,
         required this.image,
         required this.category,
      });

  factory ProductRestModel.fromJson(Map<String, dynamic> json) => _$ProductRestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRestModelToJson(this);
}