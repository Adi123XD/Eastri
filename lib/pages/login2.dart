import 'package:country_code_picker/country_code_picker.dart';
import 'package:eastri_customer_app/pages/homepage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'lib/images/bg2.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              // Back Button
              // IconButton(
              //   icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
              //   onPressed: () => Navigator.pop(context),
              //   padding: EdgeInsets.zero,
              // ),
              Positioned(
                top: 180,
                left: 60,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Eastri Logo Text
              Positioned(
                top: 250,
                left: 60,
                child: Image.asset(
                  'lib/images/eastri.png',
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.2),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(65),
                    topRight: Radius.circular(65),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 64, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter phone number',
                        style: TextStyle(
                          color: Color(0xFF6086A7),
                          fontSize: 16,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Phone Input Container
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Row(
                            children: [
                              // Country Code Dropdown
                              Container(
                                color: Colors.white,
                                child: CountryCodePicker(
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero,
                                  flagWidth: 20,
                                  onChanged: print,
                                  hideMainText: true,
                                  showFlagMain: true,
                                  showFlag: false,
                                  initialSelection: 'IN',
                                  showOnlyCountryWhenClosed: true,
                                  alignLeft: true,
                                  showDropDownButton: true,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  child: TextField(
                                    controller: _phoneController,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 12),
                                        child: Text(
                                          '+91',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                      hintText: 'Enter phone number',
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // Continue Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF606AA7),
                          minimumSize: Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // Or Divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.black.withOpacity(0.3),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black.withOpacity(0.3),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      // More Options Button
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/images/Google.png',
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Terms Text
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            'By clicking, I accept the terms of\nservice and privacy policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF2E3877),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
