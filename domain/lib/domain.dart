library domain;

import 'package:domain/src/di/locator.dart';

export 'src/common/network_exceptions.dart';
export 'src/common/result.dart';
export 'src/model/article_model.dart';
export 'src/repository/article_repository.dart';
export 'src/usecase/article_use_case.dart';

class Domain {
  static void init() {
    /// setup required locators for domain module
    setupLocator();
  }
}
