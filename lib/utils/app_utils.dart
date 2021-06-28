import '../repository/local/local_storage.dart';
import 'global_utils.dart';

// set user onboarding status to true after onboarding user into the app
void setUserOnBoardingStatus({LocalStorage? localStorage}) {
  LocalStorage _storage = localStorage ?? LocalStorageImpl();
  _storage.saveBoolData(GlobalUtis.onBoardingSharedPrefKey, true);
}
