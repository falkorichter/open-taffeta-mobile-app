import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class PlatformIndependentStorage {
  static PlatformIndependentStorage getPlatformStorage() {
    if (Platform.isAndroid || Platform.isIOS) {
      return FlutterSecureStorageWrapper();
    } else {
      return InMemoryStorage();
    }
  }

  deleteAll() {
    new Exception();
  }

  write({String key, String value}) {
    throw new Exception();
  }

  delete({String key}) {
    throw new Exception();
  }

  dynamic read({String key}) {
    throw new Exception();
  }
}

class FlutterSecureStorageWrapper implements PlatformIndependentStorage {
  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  delete({String key}) {
    storage.delete(key: key);
  }

  @override
  deleteAll() {
    storage.deleteAll();
  }

  @override
  dynamic read({String key}) {
    return read(key: key);
  }

  @override
  write({String key, String value}) {
    storage.write(key: key, value: value);
  }
}

class InMemoryStorage implements PlatformIndependentStorage {
  Map storage = {};

  deleteAll() {
    storage = {};
  }

  write({String key, String value}) {
    storage[key] = value;
  }

  delete({String key}) {
    storage.remove(key);
  }

  dynamic read({String key}) {
    return storage[key];
  }
}
