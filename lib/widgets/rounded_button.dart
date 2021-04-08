import 'package:abraraltaf/util/config.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function callBack;
  RoundedButton({this.text, this.callBack});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.yMargin(context, 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Theme.of(context).textTheme.bodyText1.color,
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: ElevatedButton(
          style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor:
                MaterialStateProperty.all(Theme.of(context).accentColor),

            elevation: MaterialStateProperty.all(4),
            // hoverElevation: 8,
            // hoverColor: Theme.of(context).accentColor,
            animationDuration: Duration(milliseconds: 2000),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: Config.xMargin(context, 3),
            ),
          ),
          onPressed: callBack,
        ),
      ),
    );
  }
}
