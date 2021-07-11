import 'package:flutter/material.dart';

class InstaLogo extends StatefulWidget {
  final double logoHeight;
  const InstaLogo({ Key? key ,required this.logoHeight}) : super(key: key);

  @override
  _InstaLogoState createState() => _InstaLogoState();
}

class _InstaLogoState extends State<InstaLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: widget.logoHeight,
        image: NetworkImage(
            'https://www.pngkey.com/png/full/828-8286178_mackeys-work-needs-no-elaborate-presentation-or-distracting.png'),
      ),
    );
  }
}