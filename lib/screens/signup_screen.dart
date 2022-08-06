import 'package:digitize_app_v1/resources/auth_methods.dart';
import 'package:digitize_app_v1/screens/login_screen.dart';
import 'package:digitize_app_v1/utils/colors.dart';
import 'package:digitize_app_v1/utils/utils.dart';
import 'package:digitize_app_v1/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _yearController.dispose();
    _branchController.dispose();
    _confirmPasswordController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        year: _yearController.text,
        branch: _branchController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text);

    setState(() {
      _isLoading = true;
    });

    if (res != "success") {
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    //Header
                    const Center(
                      child: Text(
                        "Workspace ",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cursive'),
                      ),
                    ),
                    const SizedBox(height: 34),
                    // First Name and Last Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: TextFieldInput(
                              textEditingController: _firstNameController,
                              hintText: "First Name",
                              textInputType: TextInputType.name),
                        ),
                        const VerticalDivider(),
                        Flexible(
                          child: TextFieldInput(
                              textEditingController: _lastNameController,
                              hintText: "Last Name",
                              textInputType: TextInputType.name),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    //Text Input for Email
                    TextFieldInput(
                        textEditingController: _emailController,
                        hintText: "Email",
                        textInputType: TextInputType.emailAddress),
                    // Year and Branch Input
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Flexible(
                          child: TextFieldInput(
                              textEditingController: _yearController,
                              hintText: "Year",
                              textInputType: TextInputType.datetime),
                        ),
                        const VerticalDivider(),
                        Flexible(
                          child: TextFieldInput(
                              textEditingController: _branchController,
                              hintText: "Branch",
                              textInputType: TextInputType.name),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    //Text Input for Password
                    TextFieldInput(
                      textEditingController: _passwordController,
                      hintText: "Password",
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(height: 24),
                    //Text Input for Confirm Password
                    TextFieldInput(
                      textEditingController: _confirmPasswordController,
                      hintText: "Confirm Password",
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(height: 24),
                    //Sign Up Button
                    InkWell(
                      onTap: signUpUser,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          color: blueColor,
                        ),
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              )
                            : const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Opensans',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(),
                    ),
                    // Already have an account? Log in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            "Already have an account? ",
                            style: TextStyle(fontFamily: 'Opensans'),
                          ),
                        ),
                        GestureDetector(
                          onTap: navigateToLogin,
                          child: Container(
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "LOG IN",
                              style: TextStyle(
                                  fontFamily: 'Opensans',
                                  fontWeight: FontWeight.bold,
                                  color: blueColor),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
