import "package:flutter/material.dart";
import "package:branchbuddy/widgets/index.dart" show TextLarge, TextMedium, TextSmall, InputField, ModalBottomSheet, ButtonPrimary, ButtonText;
import "package:go_router/go_router.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Variable to keep track of the state of the checkbox
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  TextLarge(text: "Let's branch together"),
                  TextMedium(text: "Growing a greener future, one at a time"),
                ],
              ),
              const Stack(
                clipBehavior: Clip.none,
                children: [
                  Image(
                    image: AssetImage("assets/images/earth.png"),
                  ),
                  Positioned(
                    left: 50,
                    top: 25,
                    child: Image(
                      image: AssetImage("assets/images/dotted_circle.png"),
                    ),
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                spacing: 8,
                children: [
                  ButtonPrimary(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return ModalBottomSheet(
                            title: "Sign In",
                            children: [
                              Form(
                                child: Column(
                                  children: [
                                    Wrap(
                                      direction: Axis.vertical,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      spacing: 32,
                                      children: [
                                        const InputField(placeholder: "Email"),
                                        const InputField(placeholder: "Password"),
                                        ButtonPrimary(
                                          onPressed: () => GoRouter.of(context).goNamed("track"),
                                          text: "Sign In",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: "Sign In",
                  ),
                  ButtonText(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (context, StateSetter setState) {
                              return ModalBottomSheet(
                                title: "Create Account",
                                children: [
                                  Form(
                                    child: Column(
                                      children: [
                                        Wrap(
                                          direction: Axis.vertical,
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          spacing: 32,
                                          children: [
                                            const InputField(placeholder: "Email"),
                                            const InputField(placeholder: "Password"),
                                            const InputField(placeholder: "Confirm Password"),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: checked,
                                                  onChanged: (bool? value) {
                                                    if (value != null) {
                                                      setState(() {
                                                        checked = value;
                                                      });
                                                    }
                                                  },
                                                ),
                                                const TextSmall(text: "I accept the policy and terms")
                                              ],
                                            ),
                                            ButtonPrimary(
                                              onPressed: () => GoRouter.of(context).goNamed("track"),
                                              text: "Sign Up",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                          );
                        },
                      );
                    },
                    text: "Create an account",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}