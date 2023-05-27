import 'package:json_annotation/json_annotation.dart';

part 'address_rest_model.g.dart';

@JsonSerializable()
class AddressRestModel {
  String street;
  String number;
  String? complement;
  String neighborhood;
  String city;
  String state;
  String zipCode;

  AddressRestModel({
    required this.street,
    required this.number,
    this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory AddressRestModel.fromJson(Map<String, dynamic> json) =>
      _$AddressRestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressRestModelToJson(this);
}
