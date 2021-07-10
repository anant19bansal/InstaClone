import 'package:flutter/material.dart';

class InstaLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: 50,
        image: NetworkImage(
            'https://www.pngkey.com/png/full/828-8286178_mackeys-work-needs-no-elaborate-presentation-or-distracting.png'),
      ),
    );
  }
}