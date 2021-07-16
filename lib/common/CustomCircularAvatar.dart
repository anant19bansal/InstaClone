import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatefulWidget {
  final bool storyRing;
  final bool storySeen;
  final String imgPath;
  final double radius;
  final EdgeInsetsGeometry? margin;
  const CustomCircularAvatar({ Key? key, 
    required this.storyRing, 
    this.storySeen=false, 
    required this.imgPath, 
    this.radius=30, 
    this.margin
  }) : super(key: key);

  @override
  _CustomCircularAvatarState createState() => _CustomCircularAvatarState();
}

class _CustomCircularAvatarState extends State<CustomCircularAvatar> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: (widget.storyRing)?withRing():withoutRing(),
    );
  }
  Widget withRing(){
    Color ringColor = (widget.storySeen)?Colors.grey:Colors.red;
    double borderWidth = (widget.storySeen)?1:2;
    return Container(
        margin: widget.margin,
        padding: (widget.storySeen)?EdgeInsets.all(3):EdgeInsets.all(2),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ringColor, width: borderWidth),
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/${widget.imgPath}'),
        ),
      );
  }
  Widget withoutRing(){
    return Container(
      margin: widget.margin,
      child: CircleAvatar(
            backgroundImage: AssetImage('assets/${widget.imgPath}'),
            radius: widget.radius,
      ),
    );
  }
}