import 'dart:async';

import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/app_colors.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  late Timer _timer;
  int _start = 120; // Countdown duration in seconds

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the countdown timer when the screen initializes
  }

  void _startTimer() {
    _start = 120; // Reset the countdown duration
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel(); // Stop the timer when it reaches 0
        });
      } else {
        setState(() {
          _start--; // Decrement the countdown value
        });
      }
    });
  }

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
              'Enter OTP Code',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'A 4 digit OTP Code has been sent',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54),
            ),
            const SizedBox(
              height: 15,
            ),
            PinCodeTextField(
              length: 6,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                selectedColor: Colors.green,
                inactiveFillColor: Colors.white,
                inactiveColor: AppColors.themeColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              controller: _otpController,
              appContext: context,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: _onTapNextPage, child: const Text('Next')),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                text: 'This code will expire in ',
                children: [
                  TextSpan(
                    text: '${_start}s',
                    style: const TextStyle(color: AppColors.themeColor),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _timer.cancel(); // Stop the existing timer
                _startTimer(); // Restart the timer
              },
              child: const Text('Resend Code'),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapNextPage() {
    Get.to(() => const CompleteProfileScreen());
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
