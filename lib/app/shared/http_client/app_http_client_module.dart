import 'package:flutter_modular/flutter_modular.dart';

import 'http_client.dart';

class AppHttpClientModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => AppHttpClientImpl(),
      export: true,
    ),
  ];
}
