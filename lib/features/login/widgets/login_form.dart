import 'package:fitness_app/config/index.dart';
import 'package:fitness_app/features/daily/screens/week_screen.dart';
import 'package:fitness_app/features/login/domain/domain.dart';
import 'package:fitness_app/shared/widgets/alert/alert.dart';
import 'package:fitness_app/shared/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';
import 'widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  void _openAlert(BuildContext context, LoginErrorType e) {
    Map<LoginErrorType, List<String>> errorData = {
      LoginErrorType.password: [
        Strings.loginErrorHeader,
        Strings.loginErrorBody
      ],
      LoginErrorType.network: [
        Strings.networkErrorHeader,
        Strings.networkErrorBody
      ],
    };

    PopupAlert.open(
      context: context,
      title: errorData[e]![0],
      desc: "\n${errorData[e]![1]}",
      buttons: [
        AlertButton(
          onPressed: () => Navigator.pop(context),
          text: Strings.loginAlertButton,
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              Strings.loginPageTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: Fonts.primarySemiBold,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          FormTextField(
            hint: Strings.loginHint,
            icon: Icons.person,
            onChanged: (String value) {
              context.read<LoginProvider>().username = value;
            },
          ),
          const SizedBox(height: 30.0),
          FormTextField(
            hint: Strings.passwordHint,
            icon: Icons.lock,
            obscure: true,
            onChanged: (String value) {
              context.read<LoginProvider>().password = value;
            },
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              Expanded(
                child: FormButton(
                  text: Strings.signUpButton,
                  textColor: Palette.accent,
                  backgroundColor: Palette.primary,
                  onPressed: () async {
                    if (!await context
                        .read<LoginProvider>()
                        .openRegistrationPage()) {
                      _openAlert(context, LoginErrorType.network);
                    }
                  },
                ),
              ),
              const SizedBox(width: 30.0),
              Expanded(
                child: FormButton(
                  text: Strings.logInButton,
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();

                    if (await context.read<LoginProvider>().login()) {
                      Navigator.pushReplacementNamed(context, WeekScreen.route);
                    } else {
                      _openAlert(context, LoginErrorType.password);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          IconTextButton(
            text: Strings.forgottenPassword,
            onPressed: () async {
              if (!await context
                  .read<LoginProvider>()
                  .openForgottenPasswordPage()) {
                _openAlert(context, LoginErrorType.network);
              }
            },
          ),
        ],
      ),
    );
  }
}