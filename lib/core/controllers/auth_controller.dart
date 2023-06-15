import 'package:chilled_haven/core/models/address_rest_model.dart';
import 'package:chilled_haven/core/storages/token_storage.dart';
import 'package:get/get.dart';

import '../api/api_util.dart';
import '../routers/constants_routers.dart';
import '/core/models/user_rest_model.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  late String _token;
  final _user = Rxn<UserRestModel>();

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    _user.value = await ApiUtil.getUser();
    String? retrievedToken = '';

    if (isLoggedIn()) {
      retrievedToken = await TokenStorage.retrieveUserToken();
      navigateToHome();
    } else {
      navigateToLogin();
    }
    _token = retrievedToken!;
  }

  Future<void> signIn(String email, String password) async {
    final result = await ApiUtil.loginUser(email, password);
    if (result == null) return;

    // add token
    await TokenStorage.saveUserToken(result);

    // add user
    _user.value = await ApiUtil.getUser();

    navigateToHome();
  }

  void navigateToLogin() => Get.offAllNamed(AUTHENTICATION_PAGE);
  void navigateToHome() => Get.offAllNamed(HOME_PAGE);

  bool isLoggedIn() => _user.value != null;

  String get firstName => _user.value!.fullName.split(' ')[0];
  AddressRestModel get address => _user.value!.defaultAddress;
}