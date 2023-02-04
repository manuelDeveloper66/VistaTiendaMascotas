import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.tittle, this.image, this.text});
  final String? tittle, image, text;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 50),
            child: Image(
            image: AssetImage(image!),
            width: 400,
            height: 300,
            ),
          ),

          Text(
            tittle!,
            style: const TextStyle(
              fontSize: 40.0,
            ),
          ),

          Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),


        ],
      ),
    );
  }
}
