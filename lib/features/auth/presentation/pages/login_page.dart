import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/router/app_router.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/form_submission_status.dart';
import 'package:eventer_app/core/utils/input_theme.dart';
import 'package:eventer_app/core/utils/solid_button.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:eventer_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:eventer_app/features/auth/presentation/bloc/password_toggle/password_toggle_cubit.dart';
import 'package:eventer_app/features/auth/presentation/pages/register_page.dart';
import 'package:eventer_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final _maxHeight = constraints.maxHeight;
            final _minHeight = constraints.minHeight;
            final _minWidth = constraints.minWidth;
            final _maxWidth = constraints.maxWidth;

            return BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                final formStatus = state.formSubmissionStatus;
                if (formStatus is FormSubmissionFailedStatus) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(formStatus.error.toString())));
                }
                if (formStatus is FormSubmissionSuccessStatus) {
                  // Navigator.pushNamed(context, AppRouter.register);
                  context.read<AuthBloc>()..add(LoggedInEvent());
                }
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: Container(
                    constraints: BoxConstraints(maxHeight: _maxHeight),
                    margin: EdgeInsets.symmetric(
                        horizontal: _maxWidth * 0.08,
                        vertical: _maxHeight * 0.05),
                    decoration: BoxDecoration(
                        // color: Theme.of(context).semiBgColor,
                        // color: Colors.red,
                        ),
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Hey,\n",
                                style: Typograph.titleStyle.copyWith(
                                  color: Theme.of(context).textColor,
                                )),
                            TextSpan(
                                text: "Login Now.",
                                style: Typograph.titleStyle.copyWith(
                                    color: Theme.of(context).textColor))
                          ])),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterPage()));
                            },
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "If you are new / ",
                                  style: Typograph.generalStyle.copyWith(
                                    color: Theme.of(context)
                                        .textColor
                                        .withOpacity(0.5),
                                  )),
                              TextSpan(
                                  text: "Create New",
                                  style: Typograph.normalStyle.copyWith(
                                      color: Theme.of(context).textColor))
                            ])),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          _emailWidget(),
                          SizedBox(height: 10.0),
                          _passwordWidget(),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Forgot Password ? / ",
                                  style: Typograph.generalStyle.copyWith(
                                    color: Theme.of(context)
                                        .textColor
                                        .withOpacity(0.5),
                                  )),
                              TextSpan(
                                  text: "Reset",
                                  style: Typograph.normalStyle.copyWith(
                                      color: Theme.of(context).textColor))
                            ])),
                          ),
                          SizedBox(height: 50.0),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return CustomSolidButton(
                                  text: "Login",
                                  height: 50.0,
                                  onTap: () {
                                    if (_loginFormKey.currentState!
                                        .validate()) {
                                      Map<String, dynamic> data = {
                                        'email': _emailController.text,
                                        'password': _passwordController.text,
                                      };
                                      context.read<LoginBloc>()
                                        ..add(LoginSubmitedEvent(
                                            loginData: data));
                                    }
                                  },
                                  width: _maxWidth,
                                  color: AppTheme.primaryColor);
                            },
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }

  Widget _emailWidget() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Email Address",
                style: Typograph.generalStyle.copyWith(
                  fontSize: 14.0,
                ),
              ),
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) => value!.isEmpty
                  ? "Email is required"
                  : (state.isEmailValid ? null : "Invalid Email Format"),
              onChanged: (value) =>
                  context.read<LoginBloc>()..add(EmailChangedEvent(value)),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputTheme.formFieldDecoration().copyWith(
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(
                //       color: Theme.of(context).formBgColor, width: 0.5),
                // ),
                fillColor: state.isEmailValid
                    ? Theme.of(context).correctFormBgColor
                    : Theme.of(context).formBgColor,
              ),
              style: Typograph.generalStyle.copyWith(),
            )
          ],
        );
      },
    );
  }

  Widget _passwordWidget() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Password",
                style: Typograph.generalStyle.copyWith(
                  fontSize: 14.0,
                ),
              ),
            ),
            BlocBuilder<PasswordToggleCubit, PasswordToggleState>(
              builder: (context, toggleState) {
                return TextFormField(
                  controller: _passwordController,
                  validator: (value) => value!.isEmpty
                      ? "Password is required"
                      : (state.isPasswordValid
                          ? null
                          : "Password must be at least 6 characters long"),
                  onChanged: (value) => context.read<LoginBloc>()
                    ..add(PasswordChangedEveneet(value)),
                  obscureText: !toggleState.isVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputTheme.formFieldDecoration().copyWith(
                      fillColor: state.isPasswordValid
                          ? Theme.of(context).correctFormBgColor
                          : Theme.of(context).formBgColor,
                      suffixIcon: IconButton(
                          onPressed: () => context.read<PasswordToggleCubit>()
                            ..togglePassword(toggleState.isVisible),
                          icon: Icon(toggleState.isVisible
                              ? EvaIcons.eyeOffOutline
                              : EvaIcons.eyeOutline))),
                  style: Typograph.generalStyle.copyWith(),
                );
              },
            )
          ],
        );
      },
    );
  }
}
