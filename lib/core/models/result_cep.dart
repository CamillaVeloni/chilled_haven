import 'package:json_annotation/json_annotation.dart';

part 'result_cep.g.dart';

@JsonSerializable()
class ResultCep {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  ResultCep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.localidade,
    required this.bairro,
    required this.uf,
    required this.ddd,
    required this.ibge,
    required this.siafi,
    required this.gia,
  });

  factory ResultCep.fromJson(Map<String, dynamic> json) =>
      _$ResultCepFromJson(json);

  Map<String, dynamic> toJson() => _$ResultCepToJson(this);
}