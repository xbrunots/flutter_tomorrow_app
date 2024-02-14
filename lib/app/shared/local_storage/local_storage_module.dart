import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';
import 'service/service.dart';

class LocalStorageModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<LocalStorage>((i) => LocalStorageImpl(), export: true),
        Bind.lazySingleton<LocalStorageService>(
          (i) => LocalStorageServiceImpl(
            localStorage: i<LocalStorage>(),
          ),
          export: true,
        ),
      ];
}
