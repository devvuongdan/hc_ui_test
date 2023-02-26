import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'app_module.dart';
import 'modules/common/cubits/bloc_observer.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = BlocAppObserver();

    await _configLocalStorage();

    runApp(
      ModularApp(
        module: AppModule(),
        child: const App(),
      ),
    );
  }, (error, stack) {
    Logger().e("runZonedGuarded", error, stack);
  });
}

Future<void> _configLocalStorage() async {
  // config Hive
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  final hivePath = "${appDocumentDirectory.path}/hive_databases";
  Logger().d("Hive path: $hivePath");
  Hive.init(hivePath);
}
