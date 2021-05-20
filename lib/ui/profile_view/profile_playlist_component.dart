import 'package:flutter/material.dart';
import 'package:openwhyd_app/constants/dimension.dart';

class PlaylistComponent extends StatelessWidget {
  final String name;
  final int nbTracks;
  final String url;

  const PlaylistComponent({Key key, this.name, this.nbTracks, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("$name taped");
      },
      child: Container(
        width: screenWidth(context, dividedBy: 1.1),
        height: screenHeight(context, dividedBy: 12),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 1,child: Icon(Icons.library_music)),
            Expanded(
              flex: 2,
              child: Text(
                name,
                softWrap: true,
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            Expanded(flex: 1,child: Text("$nbTracks tracks")),
          ],
        ),
      ),
    );
  }
}
