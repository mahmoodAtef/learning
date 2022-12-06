import 'package:flutter/material.dart';

import '../../../../core/utils/color_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(color: ColorManager.primary,
          child:  Center
            (
            child:
            CircleAvatar
              (backgroundImage:
            AssetImage('assests/images/logo1.png',
              bundle: DefaultAssetBundle.of(context) , ),
                radius: 60),
             ),)
    );
  }
}
