import 'package:flutter/material.dart';
import 'package:maged_soft_test/User_Module/Presentation/styles/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.constrain,
    required this.press,
    this.isLogin = false,
    this.isResend = false,
    this.isVerify = false,
  }) : super(key: key);

  final String? text;
  final BoxConstraints? constrain;
  final VoidCallback? press;
  final bool? isLogin;
  final bool? isVerify;
  final bool? isResend;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: isLogin!
          ? buttonContainer()
          : Text(
              'Resend Code',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: constrain!.maxWidth * 0.046,
              ),
            ),
    );
  }

  Widget buttonContainer() {
    return Container(
      padding: EdgeInsets.zero,
      width: isVerify!
          ? constrain!.maxWidth * 0.7976
          : constrain!.maxWidth * 0.6558,
      height: isVerify!
          ? constrain!.maxHeight * 0.06115
          : constrain!.maxHeight * 0.0515,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor.withOpacity(0.50),
            AppColor.primaryColor.withOpacity(0.27),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: const [0.3, 1, 1.0],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text!,
        style: TextStyle(
          color: AppColor.white,
          fontSize: constrain!.maxWidth * 0.0465,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
