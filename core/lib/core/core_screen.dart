import 'package:stacked/stacked.dart';

import 'core_view_model.dart';

abstract class CoreScreen<T extends CoreViewModel> extends StackedView<T> {
  const CoreScreen({super.key});
}
