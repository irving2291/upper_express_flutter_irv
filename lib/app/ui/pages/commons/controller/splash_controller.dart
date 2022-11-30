import 'package:upper_express_ionic/app/ui/routes/routes.dart';

class SplashController {
  final _authRepository = null;

  String? _routeName;
  String? get routeName => _routeName;

  SplashController();

  Future<void> initialize() async {
    const user = null;// await _authRepository.user;
    // _routeName = user != null ? Routes.home : Routes.login;
    _routeName = user != null ? Routes.home : Routes.login;
  }
}
