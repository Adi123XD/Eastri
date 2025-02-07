import 'package:eastri_customer_app/utils/appStrings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//pod update is pending for google maps because i don't have mac , so it is pending we will do in future
class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.selectLocation)),
      body: GoogleMap(initialCameraPosition: ),
    );
  }
}
