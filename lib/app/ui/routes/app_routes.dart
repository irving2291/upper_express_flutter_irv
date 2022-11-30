import 'package:flutter/material.dart';
import 'package:upper_express_ionic/app/ui/pages/auth/login_page.dart';
import 'package:upper_express_ionic/app/ui/pages/commons/splash_page.dart';
import 'package:upper_express_ionic/app/ui/pages/dashboard/profile_page.dart';
import 'package:upper_express_ionic/app/ui/pages/dashboard/shipment_page.dart';
import 'package:upper_express_ionic/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.splash: (_) => const SplashPage(),
  Routes.login: (_) => const LoginPage(),
  Routes.home: (_) => const ShipmentPage(),
  Routes.profile: (_) => const ProfilePage()
};
