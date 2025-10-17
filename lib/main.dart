import 'package:flutter/material.dart';
import 'package:rive_playground/app/app.bottomsheets.dart';
import 'package:rive_playground/app/app.dialogs.dart';
import 'package:rive_playground/app/app.locator.dart';
import 'package:rive_playground/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:rive/rive.dart';

Future<void> initServices() async {
  try {
    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();
    await RiveNative.init();
  } catch (e) {
    print('Error initializing services: $e');
    rethrow;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
