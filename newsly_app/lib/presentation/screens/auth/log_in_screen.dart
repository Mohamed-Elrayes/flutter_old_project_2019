import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/constants/constants.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../widgets/auth/logo_widget.dart';

import '../../../logic/bloc/login_form/login_form_bloc.dart';
import '../../widgets/auth/email_input.dart';
import '../../widgets/auth/password_input.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/auth/or_divider.dart';

import '../../../core/route/routers.dart';
import '../../widgets/custom_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              LoginFormBloc(authRepository: context.read<AuthRepository>()),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: SizedBox(
                height: _screenHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Expanded(flex: 2, child: LogoWidget()),
                    Expanded(flex: 3, child: FormFields()),
                    Expanded(flex: 2, child: LoginAnotherMethod()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormFields extends StatelessWidget {
  const FormFields({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
        buildWhen: (previous, current) => previous != current,
        listener: (context, state) async {
          if (state.status.isSubmissionSuccess) {
            Navigator.of(context)
                .pushReplacementNamed(RoutesName.bottomNavPath);
          } else if (state.status.isSubmissionFailure) {
            await errorDialog(context, state);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EmailInput(
                      initialValue: state.email.value,
                      errorText: textErrorInput(
                          isValueFieldEmpty: state.email.value.isEmpty,
                          isNotValidate: !state.email.valid,
                          msg: 'Please ensure the email entered is valid'),
                      onChanged: (value) => context
                          .read<LoginFormBloc>()
                          .add(EmailChanged(email: value))),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordInput(
                    initialValue: state.password.value,
                    errorText: state.password.value.isEmpty
                        ? null
                        : !state.password.valid
                            ? 'Password must be at least 8 characters and contain at least one letter and number'
                            : null,
                    onChanged: (value) => context.read<LoginFormBloc>().add(
                          PasswordChanged(password: value),
                        ),
                  ),
                ],
              ),
              Flexible(
                child: state.status.isSubmissionInProgress
                    ? const CircularProgressIndicator()
                    : ButtonWidget(
                        label: 'Sign In',
                        onTap: state.status.isValidated
                            ? () => context
                                .read<LoginFormBloc>()
                                .add(FormSubmittedLogin())
                            : null),
              ),
            ],
          );
        });
  }
}

class LoginAnotherMethod extends StatelessWidget {
  const LoginAnotherMethod({
    Key? key,
  }) : super(key: key);
  _handelRegisterTap(context) =>
      Navigator.of(context).pushNamed(RoutesName.signUpPath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(
          description: 'or sign in with',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: socialMediaList
                .map(
                  (item) => Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(item.icon),
                      onPressed: () {},
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextWidget('Don’t have an account?'),
            InkWell(
              onTap: () => _handelRegisterTap(context),
              child: Ink(
                child: CustomTextWidget.subTitleBold(
                  'Register',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
