import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveUserInfo(
      String? id, String? nome, String? email, bool? professor) async {
    final box = GetStorage();
    await box.write('id', id);
    await box.write('nome', nome);
    await box.write('email', email);
    await box.write('professor', professor);
    return true;
  }

  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  bool retrieveProfessor() {
    final box = GetStorage();
    return box.read('professor');
  }
}

// ignore: constant_identifier_names
enum CacheManagerKey { TOKEN }
