import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app/env_variable.dart';
import 'teamly_app/teamly_app.dart';

Future<void> main() async {
  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const Teamly());
  });
}
