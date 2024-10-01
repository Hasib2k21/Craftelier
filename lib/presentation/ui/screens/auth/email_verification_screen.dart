import 'package:crafty_bay/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Please enter Your email address',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black54),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(onPressed: _onTapNextPage, child: const Text('Next'))
          ],
        ),
      ),
    );
  }

  void _onTapNextPage(){
    Get.to(()=>const OTPVerificationScreen());
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
