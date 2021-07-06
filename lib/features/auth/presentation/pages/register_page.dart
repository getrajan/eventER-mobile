import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/router/app_router.dart';
import 'package:eventer_app/core/utils/input_theme.dart';
import 'package:eventer_app/core/utils/solid_button.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/auth/data/datasource/local_datasource.dart';
import 'package:eventer_app/features/auth/presentation/bloc/password_toggle/password_toggle_cubit.dart';
import 'package:eventer_app/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:eventer_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isTermsCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final _maxHeight = constraints.maxHeight;
              final _minHeight = constraints.minHeight;
              final _minWidth = constraints.minWidth;
              final _maxWidth = constraints.maxWidth;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: _maxWidth * 0.08,
                            vertical: _maxHeight * 0.05),
                        decoration: BoxDecoration(
                          color: Theme.of(context).semiBgColor,
                          // color: Colors.red,
                        ),
                        child: Form(
                          key: _registerFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Create,\n",
                                    style: Typograph.titleStyle.copyWith(
                                      color: Theme.of(context).textColor,
                                    )),
                                TextSpan(
                                    text: "a New Account.",
                                    style: Typograph.titleStyle.copyWith(
                                        color: Theme.of(context).textColor))
                              ])),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRouter.login);
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "If you have an account / ",
                                      style: Typograph.generalStyle.copyWith(
                                        color: Theme.of(context)
                                            .textColor
                                            .withOpacity(0.5),
                                      )),
                                  TextSpan(
                                      text: "Login",
                                      style: Typograph.normalStyle.copyWith(
                                          color: Theme.of(context).textColor))
                                ])),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              _emailWidget(),
                              SizedBox(height: 10.0),
                              _nameWidget(),
                              SizedBox(
                                height: 10.0,
                              ),
                              _passwordWidget(),
                              SizedBox(height: 10.0),
                              _confirmPasswordWidget(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: BlocBuilder<RegisterBloc, RegisterState>(
                                  builder: (context, state) {
                                    if (state.isTermsConditionCheck) {
                                      isTermsCheck =
                                          state.isTermsConditionCheck;
                                    }
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                            value: state.isTermsConditionCheck,
                                            onChanged: (value) => context.read<
                                                RegisterBloc>()
                                              ..add(
                                                  RegisterTermsConditionCheckedEvent(
                                                      isCheck:
                                                          value ?? false))),
                                        Expanded(
                                          child: RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text: "I aggree to the ",
                                                style: Typograph.generalStyle
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .textColor
                                                      .withOpacity(0.5),
                                                )),
                                            TextSpan(
                                                text: "Terms of Service ",
                                                style: Typograph.generalStyle
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .textColor)),
                                            TextSpan(
                                                text: "and ",
                                                style: Typograph.generalStyle
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .textColor
                                                            .withOpacity(0.5))),
                                            TextSpan(
                                                text: "Privacy Policy",
                                                style: Typograph.generalStyle
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .textColor))
                                          ])),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                              CustomSolidButton(
                                  text: "Register",
                                  height: 50.0,
                                  width: _maxWidth,
                                  onTap: () {
                                    if (_registerFormKey.currentState!
                                        .validate()) {
                                      if (isTermsCheck) {
                                        print("validate");
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Check terms and conditions")));
                                      }
                                    }
                                  },
                                  color: AppTheme.buttonColor),
                            ],
                          ),
                        )),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _emailWidget() {
    return BlocBuilder<RegisterBloc, RegisterState>(
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
              onChanged: (value) => context.read<RegisterBloc>()
                ..add(RegisterEmailChangedEvent(email: value)),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputTheme.formFieldDecoration().copyWith(
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

  Widget _nameWidget() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Full Name",
                style: Typograph.generalStyle.copyWith(
                  fontSize: 14.0,
                ),
              ),
            ),
            TextFormField(
              controller: _nameController,
              validator: (value) =>
                  state.isNameValid ? null : "Name is required",
              onChanged: (value) => context.read<RegisterBloc>()
                ..add(RegisterNameChangedEvent(name: value)),
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputTheme.formFieldDecoration().copyWith(
                fillColor: state.isNameValid
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
    return BlocBuilder<RegisterBloc, RegisterState>(
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
                  onChanged: (value) => context.read<RegisterBloc>()
                    ..add(RegisterPasswordChangedEvent(password: value)),
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

  Widget _confirmPasswordWidget() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Confirm Password",
                style: Typograph.generalStyle.copyWith(
                  fontSize: 14.0,
                ),
              ),
            ),
            BlocBuilder<PasswordToggleCubit, PasswordToggleState>(
              builder: (context, toggleState) {
                return TextFormField(
                  controller: _confirmPasswordController,
                  validator: (value) => value!.isEmpty
                      ? "Confirm password is required"
                      : (state.isConfirmPasswordValid
                          ? null
                          : "Password miss match"),
                  onChanged: (value) => context.read<RegisterBloc>()
                    ..add(RegisterConfirmPasswordChangedEvent(
                        confirmPassword: value)),
                  obscureText: !toggleState.isVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputTheme.formFieldDecoration().copyWith(
                      fillColor: state.isConfirmPasswordValid
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
