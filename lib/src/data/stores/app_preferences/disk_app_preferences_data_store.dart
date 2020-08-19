import 'package:flutter_door_buzzer/src/data/InMemoryStorage.dart';
import 'package:flutter_door_buzzer/src/data/stores/app_preferences/app_preferences_data_store.dart';

/// Local implementation of [AppPreferencesDataStore]
class DiskAppPreferencesDataStore implements AppPreferencesDataStore {
  final String _keyAppDarkMode = 'APP_DARK_MODE';

  final PlatformIndependentStorage storage;

  DiskAppPreferencesDataStore() : storage = PlatformIndependentStorage.getPlatformStorage();

  /// --------------------------------------------------------------------------
  ///                                Dark Mode
  /// --------------------------------------------------------------------------

  @override
  Future<bool> getDarkMode() async {
    final String darkModeString = await storage.read(key: _keyAppDarkMode);
    return darkModeString?.toLowerCase() == 'true';
  }

  @override
  Future<void> toggleDarkMode(bool darkMode) async {
    return await storage.write(
      key: _keyAppDarkMode,
      value: darkMode.toString(),
    );
  }

  @override
  Future<void> deleteDarkMode() async {
    return storage.delete(key: _keyAppDarkMode);
  }

  /// --------------------------------------------------------------------------
  ///                                    All
  /// --------------------------------------------------------------------------

  @override
  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
