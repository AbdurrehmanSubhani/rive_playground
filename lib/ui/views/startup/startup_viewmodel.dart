import 'package:stacked/stacked.dart';
import 'package:rive_playground/app/app.locator.dart';
import 'package:rive_playground/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    _navigationService.replaceWithHomeView();
  }
}
