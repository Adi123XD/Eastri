import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 101,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        color: AppColors.addressContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  color: Colors.black, size: 25),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Use current location',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: screenWidth * 0.55,
                    child: const Text(
                      'Durlabh Niwas, 1/461, Dr Baba Saheb Chawk, New Delhi',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/currentLocationScreen');
                },
                child: const Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 18),
              ),
            ],
          ),
          const Divider(color: Color(0xFFB2AEAE)),
          Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.black,
                size: 22,
              ),
              const SizedBox(width: 5),
              const Text(
                'Add Address',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/addNewAddressScreen');
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
