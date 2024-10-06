import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../state_holders/otp_verification_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/snackbar_message.dart';
import '../../widget/app_logo.dart';
import '../../widget/home/centered_circular_progress_indicator.dart';
import 'complete_profile_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final OtpVerificationController _otpVerificationController = Get.find<OtpVerificationController>();

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

  Future<void> _resendCode() async {
    bool isSent = await _otpVerificationController.resendOtp(widget.email, ''); // Trigger resend OTP
    if (isSent) {
      _timer.cancel(); // Stop the existing timer
      _startTimer(); // Restart the countdown timer
      if (mounted) {
        showSnackBarMessage(context, 'OTP resent successfully.');
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, _otpVerificationController.errorMessage ?? 'Failed to resend OTP.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(), // Your custom widget for the app logo
            const SizedBox(height: 8),
            Text(
              'Enter OTP Code',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'A 6 digit OTP Code has been sent',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 15),
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
            const SizedBox(height: 24),
            GetBuilder<OtpVerificationController>(
              builder: (otpVerificationController) {
                return Visibility(
                  visible: !otpVerificationController.inProgress,
                  replacement: const CenteredCircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Next'),
                  ),
                );
              },
            ),
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
              onPressed: _start == 0 ? _resendCode : null, // Enable resend button when countdown reaches 0
              child: const Text('Resend Code'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    bool result = await _otpVerificationController.verifyOtp(widget.email, _otpController.text);
    if (result) {
      Get.to(() => const CompleteProfileScreen());
    } else {
      if (mounted) {
        showSnackBarMessage(context, _otpVerificationController.errorMessage!);
      }
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
