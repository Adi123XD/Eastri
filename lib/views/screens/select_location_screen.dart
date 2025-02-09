import 'dart:async';
import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/services/locationServices/location_service.dart';
import 'package:eastri_customer_app/utils/appStrings/app_strings.dart';
import 'package:eastri_customer_app/utils/sizeConfig/app_sizeconfig.dart';
import 'package:eastri_customer_app/views/widgets/custom_appbar.dart';
import 'package:eastri_customer_app/views/widgets/custom_button.dart';
import 'package:eastri_customer_app/views/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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
  final TextEditingController _houseNoBlockNo = TextEditingController();
  final TextEditingController _buildingName = TextEditingController();
  final TextEditingController _howToReach = TextEditingController();
  int? _chipSelectedIndex = 0;
  final List<String> _chipName = [
    AppStrings.home,
    AppStrings.work,
    AppStrings.other
  ];
  final List<Marker> _marker = [];

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      final location = await LocationService().getUserCurrentLocation();
      final latLng = LatLng(location.latitude, location.longitude);

      final address =
          await _getAddressFromLatLng(location.latitude, location.longitude);

      setState(() {
        _yourLoaction.text = address;
        _marker.clear();
        _marker.add(
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: latLng,
            infoWindow: const InfoWindow(title: "Your Location"),
          ),
        );
      });

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 14),
      ));
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  // Convert LatLng to Address using Geocoding
  Future<String> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        String address = [
          if (place.street != null && place.street!.isNotEmpty) place.street,
          if (place.subLocality != null && place.subLocality!.isNotEmpty)
            place.subLocality,
          if (place.locality != null && place.locality!.isNotEmpty)
            place.locality,
          if (place.administrativeArea != null &&
              place.administrativeArea!.isNotEmpty)
            place.administrativeArea,
          if (place.country != null && place.country!.isNotEmpty) place.country,
          if (place.postalCode != null && place.postalCode!.isNotEmpty)
            place.postalCode,
        ].join(", ");

        print("Full Address: $address");
        return address;
      } else {
        print("No address found.");
        return "Address not found";
      }
    } catch (e) {
      print("Error converting location to address: $e");
      return "Unknown Location";
    }
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
          _buildDraggableSheet()
        ],
      ),
    );
  }

  Widget _buildDraggableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.6,
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
                SizedBox(height: AppSizeconfig.screenHeight * 0.01),
                CustomTextfield(
                    controller: _yourLoaction,
                    preffixIcon: Icon(Icons.location_on),
                    hintText: AppStrings.address,
                    validator: (value) {}),
                SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                Text(
                  AppStrings.completeAddress,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                CustomTextfield(
                    controller: _houseNoBlockNo,
                    hintText: AppStrings.houseNo,
                    validator: (value) {}),
                SizedBox(height: AppSizeconfig.screenHeight * 0.01),
                CustomTextfield(
                    controller: _buildingName,
                    hintText: AppStrings.buildingName,
                    validator: (value) {}),
                SizedBox(height: AppSizeconfig.screenHeight * 0.01),
                CustomTextfield(
                    controller: _howToReach,
                    hintText: AppStrings.howToReach,
                    validator: (value) {}),
                SizedBox(height: AppSizeconfig.screenHeight * 0.02),
                Text(
                  AppStrings.saveThisLocationForLater,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSizeconfig.screenHeight * 0.01),
                _buildChip(),
                SizedBox(height: AppSizeconfig.screenHeight * 0.04),
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
    );
  }

  Widget _buildChip() {
    return Wrap(
        spacing: 8.0,
        children: List.generate(3, (int index) {
          return ChoiceChip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AppColors.primaryColor),
            ),
            selectedColor: _chipSelectedIndex == index
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            disabledColor: AppColors.secondaryColor,
            backgroundColor: Colors.white,
            label: Text(
              _chipName[index],
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: _chipSelectedIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
            selected: _chipSelectedIndex == index,
            showCheckmark: false,
            onSelected: (bool value) {
              setState(() {
                _chipSelectedIndex = value ? index : null;
              });
            },
          );
        }));
  }
}
