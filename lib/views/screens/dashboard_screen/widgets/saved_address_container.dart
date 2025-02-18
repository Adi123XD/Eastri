import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class SavedAddressContainer extends StatelessWidget {
  final String title;
  final String address;
  final IconData endIcon;

  const SavedAddressContainer({
    super.key,
    required this.title,
    required this.address,
    required this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 96,
      width: screenWidth * 0.8,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.addressContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: screenWidth * 0.5,
                child: Text(
                  address,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.share,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Icon(
            endIcon,
            color: Colors.black,
            size: 31,
          ),
        ],
      ),
    );
  }
}
