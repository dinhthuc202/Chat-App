import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:test02/contacts_screen.dart';
import 'package:test02/home_screen.dart';

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({super.key});

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  late FlCountryCodePicker countryPicker;
  final TextEditingController phoneNumnerCotroller = TextEditingController();
  CountryCode? countryCode = const CountryCode(
    name: 'Indonesia',
    code: 'ID',
    dialCode: '+62',
  );

  @override
  void initState(){
    final favoriteCountries = ['VN','US','ID','CN'];
    countryPicker = FlCountryCodePicker(
      favorites: favoriteCountries,
      favoritesIcon: const Icon(
        Icons.star,
        color: Colors.amber,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    child: SvgPicture.asset(
                      "assets/vectors/ic_arrow_left.svg",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 98),
              const Center(
                child: Text(
                  "Enter Your Phone Number",
                  style: TextStyle(
                    color: Color(0xFF0F1828),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 40, top: 8, right: 40, bottom: 48),
                child: Center(
                  child: Text(
                    "Please confirm your country code and enter your phone number",
                    style: TextStyle(
                      color: Color(0xFF0F1828),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async{
                        final code = await countryPicker.showPicker(context: context);
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: Container(
                        height: 36,
                        width: 74,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7FC),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 11,right: 11),
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  ///bo góc ảnh
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: countryCode?.flagImage(
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              child: Text(
                                countryCode?.dialCode ?? "+62",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFADB5BD),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F7FC),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  color: Color(0xFFADB5BD),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                      (Route<dynamic> route) => false,
                  );
                },
                child: Center(
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 34,top: 81),
                    child: Container(
                      height: 52,
                      width: 327,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38),
                        color: const Color(0xFF002DE3),
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
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
