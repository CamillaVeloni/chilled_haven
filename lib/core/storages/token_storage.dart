import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'storage_constants.dart';

class TokenStorage {

  static Future<void> saveUserToken(String token) async {
    try {
      //BOX_NAME is any string key for you box name.
      final secureKey = Hive.generateSecureKey();
      final encryptedBox = await Hive.openBox(TOKEN_BOX, encryptionCipher: HiveAesCipher(secureKey));
      await encryptedBox.put('token', token);

      //SECURE_STORAGE_KEY is any string key.
      const FlutterSecureStorage secureStorage = FlutterSecureStorage();
      await secureStorage.write(
        key: SECURE_STORAGE_KEY,
        value: json.encode(secureKey),
      );
    } on Exception catch (e) {
      print(e.toString());
    }
  }
  static Future<String?> retrieveUserToken() async {
    try {
      const FlutterSecureStorage secureStorage = FlutterSecureStorage();

      final secureKey = await secureStorage.read(key: SECURE_STORAGE_KEY);
      if (secureKey == null) throw 'Sem token';
      List<int> encryptionKey = (json.decode(secureKey) as List<dynamic>).cast<int>();
      final encryptedBox = await Hive.openBox(TOKEN_BOX, encryptionCipher: HiveAesCipher(encryptionKey));
      String token = encryptedBox.get('token');

      encryptedBox.close();

      return token;
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }
}