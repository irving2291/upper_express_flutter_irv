import 'package:flutter/material.dart';
import 'package:upper_express_ionic/app/utils/my_colors.dart';
import 'package:upper_express_ionic/app/utils/responsive.dart';
import 'package:upper_express_ionic/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';
  final double _radius = 10;
  final double _textFormFieldBorderWeight = 1;

  Future<void> _submit (BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final ButtonStyle buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius),
          )),
      backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor),
    );

    const textStyle = TextStyle();
    const InputDecoration inputDecoration = InputDecoration(
      hintStyle: TextStyle(color: MyColors.backgroundAccent),
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(),
      focusedBorder: InputBorder.none,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(
        maxWidth: responsive.isTablet ? 450 : 360,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: textStyle,
                    validator: (text) {
                      if (!text.toString().trim().contains("@")) {
                        return 'error credential';
                      }
                      return null;
                    },
                    decoration:
                    inputDecoration.copyWith(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: _textFormFieldBorderWeight,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(_radius),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: _textFormFieldBorderWeight,
                          color: MyColors.backgroundAccent,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
                      ),
                      hintText: S.current.usernameOrEmail,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: MyColors.backgroundAccent,
                      ),
                    ),
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(),
                    validator: (text) {
                      if (text.toString().trim() == "") {
                        return 'error credential';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: inputDecoration.copyWith(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: _textFormFieldBorderWeight,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(_radius),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: _textFormFieldBorderWeight,
                          color: MyColors.backgroundAccent,
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(_radius),
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: MyColors.backgroundAccent,
                      ),
                      hintText: S.current.password,
                    ),
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(S.current.forgotPassword),
              ),
            ),
            SizedBox(height: responsive.dp(1),),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _submit(context),
                style: buttonStyle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(S.current.logIn),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Expanded(
                  child: Divider(),
                ),
                Text(S.current.or),
                const Expanded(
                  child: Divider(),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _submit(context),
                style: buttonStyle.copyWith(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.transparent,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    S.current.signUp,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
