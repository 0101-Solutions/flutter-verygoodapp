import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verygoodapp/app/view/widgets/custom_outline_button.dart';
import 'package:verygoodapp/app/view/widgets/custom_raised_button.dart';
import 'package:verygoodapp/app/view/widgets/custom_textfield.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: _buildLogo(context),
              ),
              const SizedBox(
                height: 50,
              ),
              _buildAuthUI(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Unakula',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: ' Wapi?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildAuthUI(BuildContext context) => SizedBox(
        height: 500,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          children: [
            _signIn(context),
            _signUp(context),
          ],
        ),
      );

  Widget _signIn(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ...emailAndPassword(),
            const SizedBox(height: 30),
            CustomRaisedButton(
              text: 'Sign In',
              size: const Size(double.infinity, 54),
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            CustomOutlineButton(
              size: const Size(double.infinity, 50),
              text: 'Sign In With Google',
              icon: SvgPicture.asset(
                'assets/google-icon.svg',
                height: 18,
                width: 18,
                fit: BoxFit.fill,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 60),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: const Color.fromARGB(255, 0, 0, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _signUp(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Username',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              obscureText: false,
              onChanged: (val) {},
            ),
            const SizedBox(height: 30),
            ...emailAndPassword(),
            const SizedBox(height: 30),
            CustomRaisedButton(
              text: 'Sign Up',
              size: const Size(double.infinity, 54),
              onPressed: () {},
            ),
            const SizedBox(height: 60),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: const Color.fromARGB(255, 0, 0, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.elasticOut,
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  List<Widget> emailAndPassword() => [
        CustomTextField(
          hint: 'Email',
          fontSize: 18,
          fontWeight: FontWeight.normal,
          obscureText: false,
          onChanged: (val) {},
        ),
        const SizedBox(height: 30),
        CustomTextField(
          hint: 'Password',
          fontSize: 18,
          fontWeight: FontWeight.normal,
          obscureText: true,
          onChanged: (val) {},
        ),
      ];
}
