import 'package:rive/rive.dart';
import 'package:rive_playground/constants.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  late FileLoader fileLoader;
  late File file;

  void initRiveControllerWithTestArt() async {
    try {
      setBusy(true);
      fileLoader = FileLoader.fromAsset(
        riveAnimationPath,
        riveFactory: Factory.rive,
      );
      logger.i('Test Rive controller initialized');
    } catch (e) {
      print('Error initializing Rive controller: $e');
      throw Exception('Failed to initialize Rive controller $e');
    } finally {
      setBusy(false);
    }
  }
}
