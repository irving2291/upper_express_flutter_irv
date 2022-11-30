import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:upper_express_ionic/app/ui/pages/auth/controller/login_controller.dart';
import 'package:upper_express_ionic/app/ui/pages/auth/widgets/login_form.dart';
import 'package:upper_express_ionic/app/utils/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(
          create: (_) => LoginController(),
          lazy: true,
        ),
      ],
      child: const LoginPageWrapper(),
    );
  }
}

class LoginPageWrapper extends StatefulWidget {
  const LoginPageWrapper({Key? key}) : super(key: key);

  @override
  State<LoginPageWrapper> createState() => _LoginPageWrapperState();
}

class _LoginPageWrapperState extends State<LoginPageWrapper> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: responsive.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 160,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/logo_upper_express.svg',
                        width: responsive.dp(20),
                      ),
                      const SizedBox(height: 15,),
                      const LoginForm(),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

