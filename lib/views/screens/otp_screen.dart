import 'package:eastri_customer_app/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressed: () {
        Navigator.pop(context);
      }),
    );
  }
}
