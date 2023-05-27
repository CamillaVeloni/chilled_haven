import 'package:json_annotation/json_annotation.dart';

import 'address_rest_model.dart';

part 'user_rest_model.g.dart';

@JsonSerializable()
class UserRestModel {
  String fullName;
  String email;
  String password;
  AddressRestModel defaultAddress;

  UserRestModel(
      {required this.fullName,
        required this.email,
        required this.password,
        required this.defaultAddress,
      });

  factory UserRestModel.fromJson(Map<String, dynamic> json) => _$UserRestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRestModelToJson(this);
}