
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mybud/api_service/add_location.dart';
import 'package:mybud/api_service/upload_image.dart';
import 'package:mybud/screens/descibe_yourself_screen.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:csc_picker/csc_picker.dart';

class ProfileUploadScreen extends StatefulWidget {
  // final Function func;
  // const ProfileUploadScreen({Key? key}) : super(key: key);
  // ProfileUploadScreen({required this.func});
  @override
  State<ProfileUploadScreen> createState() => _ProfileUploadScreenState();
}

class _ProfileUploadScreenState extends State<ProfileUploadScreen> {
  var imageFile;
  final picker = ImagePicker();
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String address = "";

  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      imageFile = File(pickedFile!.path);
    });

    // widget.func(imageFile);
  }

  void _onSubmit(context) async {
    AddImage imageProvider = Provider.of<AddImage>(context, listen: false);

    //  if(response['success']== )
    if (imageFile != null && cityValue != "") {
      imageProvider.addImage(image: imageFile);
      var response =
          AddLocation.verify('$stateValue, $cityValue', tokenProfile?.token);
      print('ress$response');
      print("ffff$imageFile");
      loginPreference!.setLoginStat(true);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DescribeYourselfScreen()));
    } else {
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Kindly upload your latest picture to proceed",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getpermission() async {
    if(await Permission.location.serviceStatus.isEnabled){
      var status = await Permission.location.status;
      if(status.isGranted){

      } else if(status.isDenied) {
        Map<Permission, PermissionStatus> status = await [Permission.location,].request();
      } else if(status.isPermanentlyDenied) {
        openAppSettings();
      }
    } else {

    }
  }

  @override
  void initState() {
    getpermission();
    super.initState();
  }

  double kDesignWidth = 375;
  double kDesignHeight = 812;
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _widthScale * 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _heightScale * 37),
                Row(
                  children: [
                    Container(
                      height: _heightScale * 5,
                      width: _widthScale * 82,
                      color: const Color(0xFF7B2CBF),
                    ),
                    Container(
                      height: _heightScale * 5,
                      width: _widthScale * 230,
                      color: const Color(0xFFF3F3F3),
                    ),
                  ],
                ),
                SizedBox(
                  height: _heightScale * 30,
                ),
                Text(
                  'Upload a',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF775594)),
                ),
                Text(
                  'Profile Picture',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF775594)),
                ),
                SizedBox(
                  height: _heightScale * 18,
                ),
                Text('You can change this later',
                    style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF767676),
                    )),
                SizedBox(
                  height: _heightScale * 28,
                ),
                imageFile != null
                    ? buildImages()
                    : Container(
                        height: _heightScale * 327,
                        width: _widthScale * 327,
                        color: Color(0xFFF3F3F3),
                        child: IconButton(
                          icon: const Icon(Icons.add_circle_outline_outlined),
                          onPressed: () {
                            print('ttyyy$imageFile');
                            chooseImage(ImageSource.gallery);
                          },
                          iconSize: _widthScale * 39,
                          color: Color(0xFF775594),
                        ),
                      ),
                SizedBox(
                  height: _heightScale * 18,
                ),
                CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: true,

                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.DISABLE,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: "Country",
                  stateDropdownLabel: " State",
                  cityDropdownLabel: " City",

                  ///Default Country

                  ///Disable country dropdown (Note: use it with default country)
                  //disableCountry: false,

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                    setState(() {
                      ///store value in country variable
                      countryValue = value;
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    setState(() {
                      ///store value in state variable
                      stateValue = value;
                    });
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                    setState(() {
                      ///store value in city variable
                      cityValue = value;
                    });
                  },
                ),

                ///print newly selected country state and city in Text Widget
                // TextButton(
                //     onPressed: () {
                //       setState(() {
                //         address = "$cityValue, $stateValue, $countryValue";
                //       });
                //     },
                //     child: Text("Print Data")),
                // Text(address),
                SizedBox(
                  height: _heightScale * 28,
                ),
                ElevatedButton(
                  onPressed: () {
                    _onSubmit(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: BoxColor.PurpleBox(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    height: _heightScale * 56,
                    width: _widthScale * 328,
                    alignment: Alignment.center,
                    child: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImages() {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    print('ttyyyt$imageFile');
    return Container(
      height: _heightScale * 327,
      width: _widthScale * 327,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: FileImage(imageFile), fit: BoxFit.fill)),
    );
  }
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  var imageFile;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Picker",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: imageFile != null
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildImages(),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.orange, BlendMode.color),
                                child: buildImages()),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.grey, BlendMode.color),
                                child: buildImages()),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.green, BlendMode.darken),
                                child: buildImages()),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.orange, BlendMode.color),
                                child: buildImages()),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.green, BlendMode.colorBurn),
                                child: buildImages()),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.orange, BlendMode.colorBurn),
                                child: buildImages()),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.blue, BlendMode.colorBurn),
                                child: buildImages()),
                            ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.red, BlendMode.color),
                                child: buildImages()),
                          ],
                        ),
                      )
                    : Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        color: Colors.redAccent,
                        onPressed: () {
                          chooseImage(ImageSource.camera);
                        },
                        child: Text(
                          "Camera",
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    FlatButton(
                        color: Colors.redAccent,
                        onPressed: () {
                          chooseImage(ImageSource.gallery);
                        },
                        child: Text(
                          "Gallery",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImages() {
    return Container(
      height: 500,
      width: 350,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: FileImage(imageFile), fit: BoxFit.fill)),
    );
  }
}

// class ChangeProfilePhoto extends StatefulWidget {
//   final widthScale;
//   final func;

//   ChangeProfilePhoto({@required this.widthScale, @required this.func});

//   @override
//   _ChangeProfilePhotoState createState() => _ChangeProfilePhotoState();
// }

// class _ChangeProfilePhotoState extends State<ChangeProfilePhoto> {
//   final imagePicker = ImagePicker();
//  late File file;

//   void imageSelect(bool fromCamera) async {
//     final image = fromCamera
//         ? await imagePicker.getImage(source: ImageSource.camera)
//         : await imagePicker.getImage(source: ImageSource.gallery);
//     setState(() {
//       file = File(image!.path);
//     });
//     widget.func(file);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CoverContainer(
//       widthScale: widget.widthScale,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Change Profile Photo',
//             style: CustomTextStyle.montserrat12512W500(context),
//             textScaleFactor: widget.widthScale,
//           ),
//           const SizedBox(
//             height: 20,
//             width: double.infinity,
//           ),
//           Center(
//             child: Container(
//               width: 70 * widget.widthScale,
//               height: 70 * widget.widthScale,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Color.fromRGBO(173, 180, 200, 1),
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//                 color: BoxColor.coverWhiteBox(context),
//                 image: file != null
//                     ? DecorationImage(
//                         image: FileImage(file),
//                         fit: BoxFit.cover,
//                       )
//                     : null,
//               ),
//               child: Material(
//                 color: Colors.white.withOpacity(0.0),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(10),
//                   splashColor: Color.fromRGBO(173, 180, 200, 0.5),
//                   onTap: () {
//                     showModalBottomSheet(
//                       backgroundColor: BoxColor.whiteBox(context),
//                       elevation: 100,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(20),
//                         ),
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Container(
//                           height: 100,
//                           padding: const EdgeInsets.all(10),
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               CustomSubmitButton.whiteButton(
//                                   func: () => imageSelect(false),
//                                   scale: widget.widthScale,
//                                   width: 100,
//                                   title: 'From Gallery'),
//                               CustomSubmitButton.blueButton(
//                                   func: () => imageSelect(true),
//                                   scale: widget.widthScale,
//                                   width: 100,
//                                   title: 'From Camera'),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: Container(
//                       width: 70 * widget.widthScale,
//                       height: 70 * widget.widthScale,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: EdgeInsets.all(5),
//                       child: file == null
//                           ? Icon(
//                               Icons.person,
//                               color: IconColor.blue124ToLiteBlue(context),
//                             )
//                           : null),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 14),
//         ],
//       ),
//     );
//   }
// }
