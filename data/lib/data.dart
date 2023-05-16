library data;

import 'package:data/src/datasource/prefs/db/shared_objects.dart';
import 'package:data/src/di/locator.dart';

class Data {
  static void init() async {
    SharedObjects.prefs = (await CachedSharedPreferences.getInstance())!;

    /// setup required locators for data module
    setupLocator();
  }
}
