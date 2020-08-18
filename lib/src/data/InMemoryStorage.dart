class InMemoryStorage {
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
