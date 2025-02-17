import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eastri_customer_app/res/appColors/app_colors.dart';

class AddMoneyContainer extends StatefulWidget {
  const AddMoneyContainer({super.key});

  @override
  State<AddMoneyContainer> createState() => _AddMoneyContainerState();
}

class _AddMoneyContainerState extends State<AddMoneyContainer> {
  double _containerHeight = 106;
  final TextEditingController _amountController = TextEditingController();

  void _toggleContainer() {
    setState(() {
      _containerHeight = _containerHeight == 106 ? 300 : 106;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: screenWidth * 0.8,
          height: _containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.walletContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: _containerHeight == 300
                  ? SingleChildScrollView(
                      child: _buildExpandedContent(screenWidth),
                    )
                  : _buildCollapsedContent(screenWidth),
            ),
          ),
        ),
        GestureDetector(
          onTap: _toggleContainer,
          child: Container(
            width: screenWidth * 0.8,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                "Add Money",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCollapsedContent(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dashboard/wallet1.png',
              height: screenWidth * 0.07,
              width: screenWidth * 0.07,
            ),
            const SizedBox(width: 5),
            SizedBox(
              height: screenWidth * 0.1,
              width: screenWidth * 0.24,
              child: Image.asset(
                'assets/images/dashboard/eastriLogo2.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                'Wallet',
                style: TextStyle(
                  color: AppColors.walletText,
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Wallet and Gift Card Balance',
              style: TextStyle(
                color: AppColors.walletText,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 15,
            ),
            const Spacer(),
            Text(
              "₹0",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildExpandedContent(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCollapsedContent(screenWidth),
        const SizedBox(height: 20),
        Text(
          "Add money to Eastri Wallet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Enter Amount",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 34,
          child: TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(
              color: AppColors.amountText,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildAmountRow(['500', '1000'], screenWidth),
        const SizedBox(height: 15),
        _buildAmountRow(['2000', '5000'], screenWidth),
      ],
    );
  }

  Widget _buildAmountRow(List<String> amounts, double screenWidth) {
    return Row(
      children: [
        Flexible(
          child: _buildAmountButton(amounts[0], screenWidth),
        ),
        SizedBox(width: screenWidth * 0.03),
        Flexible(
          child: _buildAmountButton(amounts[1], screenWidth),
        ),
      ],
    );
  }

  Widget _buildAmountButton(String amount, double screenWidth) {
    return GestureDetector(
      onTap: () => setState(() => _amountController.text = amount),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          "₹ $amount",
          style: TextStyle(
            color: AppColors.amountText,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
