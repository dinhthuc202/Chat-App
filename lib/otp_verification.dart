import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  bool showDot1 = true;
  bool showDot2 = true;
  bool showDot3 = true;
  bool showDot4 = true;
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
                padding: const EdgeInsets.only(top: 14,),
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
              Padding(
                padding: const EdgeInsets.only(top: 98,),
                child: Container(
                  alignment: Alignment.center,
                  child: const Column(
                    children: <Widget>[
                       Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Enter Code",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 48, left: 58,right: 58,),
                        child: Text(
                          "We have sent you an SMS with the code to +62 1309 - 1710 - 1920",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        showDot1 = false;
                      });
                    },
                    child: showDot1 ? dotInOTPVerification(txt1.text) : myInputBox(context, txt1,showDot1),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        showDot2 = false;
                      });
                    },
                    child: showDot2 ? dotInOTPVerification(txt2.text) : myInputBox(context, txt2,showDot2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller, bool showDot)
{
  return Container(
    height: 40,
    width: 32,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
    ),
    child: Center(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          counterText: '',
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        onChanged: (value){
          if(value.isEmpty){
            showDot = true;
          }else if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    ),
  );
}

Widget dotInOTPVerification(String text){
  return Container(
    height: 24,
    width: 24,
    decoration: BoxDecoration(
      color:const Color(0xFFEDEDED),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
