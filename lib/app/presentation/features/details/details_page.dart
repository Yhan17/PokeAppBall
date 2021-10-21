import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/components/header_details_component.dart';
import 'package:pokeappball/app/presentation/shared/components/rounded_container_component.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget> [
          Container( width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(color: Color(0xFF282828)),
            child: Wrap(
              children: const <Widget>[
                SizedBox(
                  height:297,
                  child: Padding(
                    padding: EdgeInsets.only(top: 64, left: 36, right: 36),
                    child: HeaderComponent(),
                  ),
                ),
                RounderContainer(),
              ],
            ),
          ),
            Padding(padding:const EdgeInsets.only(bottom: 180,left: 50),child: Align(alignment: Alignment.center,child: Image.asset("assets/images/pikachuimg.png", width: 180,))),
          ],
        ),
    );
  }
}
