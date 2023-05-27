import 'package:chilled_haven/core/controllers/auth_controller.dart';
import 'package:chilled_haven/core/models/address_rest_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/api/api_util.dart';
import '../../core/models/result_cep.dart';
import '../../core/models/user_rest_model.dart';

class LoginController extends GetxController {

  final _keyForm = GlobalKey<FormState>();
  final _isLogin = true.obs;
  final _isZipCodeValid = false.obs;

  late TextEditingController _emailController;
  late TextEditingController _zipCodeController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _stateController;
  late TextEditingController _cityController;
  late TextEditingController _neighborhoodController;
  late TextEditingController _streetController;
  late TextEditingController _numberController;
  late TextEditingController _complementController;

  bool get isLogin => _isLogin.value;
  bool get isZipCodeValid => _isZipCodeValid.value;

  GlobalKey<FormState> get keyForm => _keyForm;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get zipCodeController => _zipCodeController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get stateController => _stateController;
  TextEditingController get cityController => _cityController;
  TextEditingController get neighborhoodController => _neighborhoodController;
  TextEditingController get streetController => _streetController;
  TextEditingController get numberController => _numberController;
  TextEditingController get complementController => _complementController;

  bool get requirementRegister => isLogin ? false : true;
  String get btnText => isLogin ? 'Entrar' : 'Registrar';
  String get btnChangeStatusText => isLogin
      ? 'Não possui uma conta? Registre-se já!'
      : 'Já possui uma conta? Clique aqui para entrar!';

  void changeLoginStatus() => _isLogin.value = !_isLogin.value;

  void onButtonClick() async {
    if (!_keyForm.currentState!.validate()) return;

    isLogin ? _signIn() : _register();
  }

  void _signIn() => AuthController.to.signIn(_emailController.text, _passwordController.text);

  Future<void> _register() async {
    final result = await ApiUtil.registerUser(_generateUserModel());
    if (!result) return;

    _isLogin.value = !_isLogin.value;
  }

  UserRestModel _generateUserModel() {
    return UserRestModel(
      email: _emailController.text,
      password: _passwordController.text,
      fullName: _nameController.text,
      defaultAddress: AddressRestModel(
        zipCode: _zipCodeController.text,
        city: _cityController.text,
        neighborhood: _neighborhoodController.text,
        state: _stateController.text,
        street: _streetController.text,
        number: _numberController.text,
        complement: _complementController.text,
      )
    );
  }

  void _fillCepData(ResultCep cep) {
    _stateController.text = cep.uf;
    _cityController.text = cep.localidade;
    _neighborhoodController.text = cep.bairro;
    _streetController.text = cep.logradouro;
  }

  void searchZipCode() async {
    try {
      final client = await ApiUtil.getViaCepClient();
      final resultCep = await client.getUserCep(_zipCodeController.text);

      _fillCepData(resultCep);
      _isZipCodeValid.value = true;
    } catch(obj) {
      // non-200 error goes here.
      print('requisição invalida');
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
      _isZipCodeValid.value = false;
    }
  }

  @override
  void onInit() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _zipCodeController = TextEditingController();
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    _neighborhoodController = TextEditingController();
    _streetController = TextEditingController();
    _numberController = TextEditingController();
    _complementController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _zipCodeController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _neighborhoodController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    _complementController.dispose();
    super.onClose();
  }

}
