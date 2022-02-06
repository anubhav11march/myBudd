import 'package:flutter/material.dart';
import 'package:mybud/api_service/get_user_image.dart';
import 'package:mybud/widgets/token_profile.dart';

class Imageee extends StatefulWidget {
  const Imageee({ Key? key }) : super(key: key);

  @override
  _ImageeeState createState() => _ImageeeState();
}

class _ImageeeState extends State<Imageee> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var res;
  Future<void> getData() async {
    res = await getUserImage(tokenProfile?.token);
    print('opop$res');
    // final ByteData imageData =
    //     await NetworkAssetBundle(Uri.parse("uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png")).load("");
    // final Uint8List bytes = imageData.buffer.asUint8List();
    // print('bytes$bytes');
    // Image.memory(bytes);
  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: res,
              
            ),
          ],
        ),
      ),
    );
  }
}