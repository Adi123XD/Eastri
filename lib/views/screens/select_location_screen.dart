import 'dart:async';
import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/utils/appStrings/app_strings.dart';
import 'package:eastri_customer_app/utils/sizeConfig/app_sizeconfig.dart';
import 'package:eastri_customer_app/views/widgets/custom_appbar.dart';
import 'package:eastri_customer_app/views/widgets/custom_button.dart';
import 'package:eastri_customer_app/views/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _yourLoaction = TextEditingController();
  final TextEditingController _compeletAddress = TextEditingController();
  final TextEditingController _howToReach = TextEditingController();
  final List<Marker> _marker = [];
  final List<Marker> _list = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(title: "Current Location"),
    )
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppStrings.selectLocation,
        onPressed: () {},
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: SelectLocationScreen._kGooglePlex,
              mapType: MapType.normal,
              myLocationEnabled: true,
              compassEnabled: true,
              markers: Set.of(_marker),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),

          /// Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                      Text(
                        AppStrings.selectYourLocation,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                      Text(
                        AppStrings.yourLocation,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                      CustomTextfield(controller: _yourLoaction),
                      SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                      CustomButton(
                          buttonName: AppStrings.saveAddress,
                          isEnabled: true,
                          borderSideEnabled: false,
                          onPressed: () {}),
                      SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                      CustomButton(
                          buttonName: AppStrings.skip,
                          isEnabled: false,
                          backgroundColor: AppColors.secondaryColor,
                          textColor: Colors.black,
                          borderSideEnabled: true,
                          onPressed: () {}),
                      SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
