import 'package:flutter/material.dart';

class RounderContainer extends StatefulWidget {
  const RounderContainer({
    Key? key,
  }) : super(key: key);
  @override
  _RounderContainerState createState() => _RounderContainerState();
}

class _RounderContainerState extends State<RounderContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(62),
          topRight: Radius.circular(62),
        ),
      ),
    );
  }
}
