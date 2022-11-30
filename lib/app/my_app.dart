import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:upper_express_ionic/app/ui/routes/app_routes.dart';
import 'package:upper_express_ionic/app/ui/routes/routes.dart';
import 'package:upper_express_ionic/app/utils/my_colors.dart';
import 'package:upper_express_ionic/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Upper Express App',
      theme: ThemeData(
        backgroundColor: MyColors.background,
        primaryColor: MyColors.primary,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: Routes.splash,
      routes: appRoutes,
    );
  }
}

