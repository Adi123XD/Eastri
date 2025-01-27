import 'package:eastri_customer_app/pages/login2.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class EastriLoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  EastriLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/images/bg.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //   SizedBox(height: 16),
                    // Back Button
                    // IconButton(
                    //   icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    //   onPressed: () => Navigator.pop(context),
                    //   padding: EdgeInsets.zero,
                    // ),
                    SizedBox(height: 200),
                    // Welcome Text
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Eastri Logo Text
                    Image.asset(
                      'lib/images/eastri.png',
                    ),
                    SizedBox(height: 60),
                    // Phone Input Container

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
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
                                            color: Colors.black, fontSize: 16),
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
                              builder: (context) => LoginScreen()),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.3),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.3),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
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
                    Spacer(),
                    // Terms Text
                    Padding(
                      padding: EdgeInsets.only(bottom: 140),
                      child: Center(
                        child: Text(
                          'By clicking, I accept the terms of\nservice and privacy policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
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
          ),
        ],
      ),
    );
  }
}
