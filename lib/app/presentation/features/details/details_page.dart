import 'package:flutter/material.dart';
import 'package:pokeappball/app/presentation/shared/components/header_info_component.dart';
import 'package:pokeappball/app/presentation/shared/components/round_container_component.dart';

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
    final heightContainer = MediaQuery.of(context).size.height < 600 ? MediaQuery.of(context).size.height + 85 : MediaQuery.of(context).size.height+20;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: heightContainer,
              decoration: const BoxDecoration(color: Color(0xFF282828)),
              child: Wrap(
                children: const <Widget>[
                  SizedBox(
                    height: 295,
                    child: Padding(
                      padding: EdgeInsets.only(top: 64, left: 36, right: 36),
                      child: HeaderInfo(),
                    ),
                  ),
                  RoundContainer(),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 145, left: 50),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/pikachuimg.png",
                      width: 180,
                    ))),
          ],
        ),
      ),
    );
  }
}
