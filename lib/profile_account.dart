import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger/models/apis.dart';
import 'package:messenger/common/app_colors.dart';
import 'package:messenger/common/app_text_style.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/widgets/dialog.dart';

class ProfileAccount extends StatefulWidget {
  final ChatUser user;
  const ProfileAccount({super.key, required this.user});

  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  final _formKey = GlobalKey<FormState>();
  String? _image;
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path) as String?;
      });
    }
  }


  @override
  void initState() {
    super.initState();
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
                  padding: const EdgeInsets.only(top: 14,bottom: 59,),
                  child: Row(
                    children: [
                      InkWell(
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
                      Text(
                        "Your Profile",
                        style: AppTextStyle.primaryS18W600,
                      )
                    ],
                  ),
                ),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(50),
                                child: Image.network(
                                  widget.user.image,
                                  width: 92,
                                  height: 92,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 73,top: 77),
                                child: InkWell(
                                  onTap: (){
                                    _showBottomSheetImage();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/vectors/ic_plus_circle.svg",
                                    fit: BoxFit.scaleDown,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 327,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.backgroundInput,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              initialValue: widget.user.name,
                              onSaved: (val) => APIs.me.name = val ?? '',
                              validator: (val) => val != null && val.isNotEmpty
                                  ? null
                                  : 'Required Field',
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Name (Required)",
                                border: InputBorder.none,
                                hintStyle: AppTextStyle.primaryS14W600.copyWith(
                                  color: AppColors.textHintPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 12,bottom: 68,),
                          child: Container(
                            width: 327,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.backgroundInput,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                initialValue: widget.user.status,
                                keyboardType: TextInputType.text,
                                onSaved:(value) => APIs.me.status = value ?? '',
                                decoration: InputDecoration(
                                  hintText: "About (Optional)",
                                  border: InputBorder.none,
                                  hintStyle: AppTextStyle.primaryS14W600.copyWith(
                                    color: AppColors.textHintPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              APIs.updateUserInfo().then((value) {
                                Dialogs.showSnackbar(
                                    context, 'Profile Updated Successfully!');
                              });
                            }
                          },
                          child: Container(
                            height: 52,
                            width: 327,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38),
                              color: AppColors.colorPrimary,
                            ),
                            child: const Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  color: AppColors.textButtonPrimary,
                                ),
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

  void _showBottomSheetImage() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding:
            EdgeInsets.only(top: 30, bottom: 30),
            children: [
              //pick profile picture label
              const Text('Pick Profile Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              //for adding some space
              SizedBox(height: 20),

              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  InkWell(
                    onTap: ()async {
                      final ImagePicker picker = ImagePicker();

                      // Pick an image
                      final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery, imageQuality: 80);
                      if (image != null) {
                        print('Image Path: ${image.path}');
                        setState(() {
                          _image = image.path;
                        });

                        APIs.updateProfilePicture(File(_image!));
                        // for hiding bottom sheet
                        Navigator.pop(context);
                      }
                    },
                      child: const Center(
                          child: Icon(
                            Icons.image,
                            size: 50,
                          ),
                      )
                  ),

                  //take picture from camera button
                  InkWell(
                    onTap: ()async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                          source: ImageSource.camera, imageQuality: 80);
                      if (image != null) {
                        print('Image Path: ${image.path}');
                        setState(() {
                          _image = image.path;
                        });

                        APIs.updateProfilePicture(File(_image!));
                        // for hiding bottom sheet
                        Navigator.pop(context);
                      }
                    },
                      child: const Center(
                        child: Icon(
                          Icons.add_a_photo,
                        size: 50,
                        ),
                      ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
