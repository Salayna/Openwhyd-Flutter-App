import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialComponent extends StatelessWidget {
  //final String igrm;
  //final String sc;
  //final String yt;
  //final String tw;
  //final String fb;
  //final String home;

  //const SocialComponent({Key key, this.igrm, this.sc, this.yt, this.tw, this.fb, this.home}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: Chip(
            backgroundColor: Colors.purple[200],
            label:  FaIcon(FontAwesomeIcons.instagram),
          ),
        ),
        Flexible(
          child: Chip(
              backgroundColor: Colors.blue[200],
            label: FaIcon(FontAwesomeIcons.twitter)
          ),
        ),
        Flexible(
          child: Chip(
            backgroundColor: Colors.deepOrange[200],
            label: FaIcon(FontAwesomeIcons.soundcloud),

          ),
        ),
        Flexible(
          child: Chip(
              backgroundColor: Colors.blue[300],
            label: FaIcon(FontAwesomeIcons.facebook)
          ),
        ),
        Flexible(
          child: Chip(
              backgroundColor: Colors.red[200],
            label: FaIcon(FontAwesomeIcons.youtube)),
        ),
        Flexible(
          child: Chip(
            backgroundColor: Colors.green[200],
            label: FaIcon(FontAwesomeIcons.globeEurope),
        ),
        ),
      ],
    );
  }
}
