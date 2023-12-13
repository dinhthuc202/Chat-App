import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messenger/profile_account.dart';
class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  bool invalidOTP = false;

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
              Center(
                child: SizedBox(
                  width: 248,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      myInputBox(context, _controllers[0],),
                      myInputBox(context, _controllers[1],),
                      myInputBox(context, _controllers[2],),
                      myInputBox(context, _controllers[3],),
                    ],
                  ),
                    ///if(_controllers[0].text.isNotEmpty && _controllers[1].text.isNotEmpty && _controllers[2].text.isNotEmpty && _controllers[3].text.isNotEmpty)
                  ///chekOtp();
              ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SizedBox(
                    width: 100,
                    height: 20,
                    child: invalidOTP ? const Text(
                      "Invalid otp!",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ) : const Text(""),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 67),
                child: Center(
                  child: SizedBox(
                    width: 116,
                    height: 52,
                    child: Center(
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(
                            color: Color(0xFF002DE3),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget myInputBox(BuildContext context, TextEditingController controller)
  {
    return Container(
      height: 40,
      width: 32,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Color(0xFF0F1828),
        ),
        onChanged: (value){
          if (_controllers.every((controller) => controller.text.isNotEmpty)) {
            final otp = _controllers[0].text + _controllers[1].text + _controllers[2].text + _controllers[3].text;
            if(otp == '0000'){
              invalidOTP = false;
              ///chuyển sang màn hình tiếp theo
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const ProfileAccount(),
              //   ),
              // );
            }else {
              setState(() {
                invalidOTP = true;
                for(var i = 0; i<4;i++)
                {
                  _controllers[i].clear();
                }
              });
            }
          } else if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}


Widget dotInOTPVerification(){
  return Container(
    height: 24,
    width: 24,
    decoration: BoxDecoration(
      color:const Color(0xFFEDEDED),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}