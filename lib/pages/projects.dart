import 'package:first_proj/lists/project_list.dart';
import 'package:first_proj/util/config.dart';
import 'package:first_proj/widgets/project_preview.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height,
      padding: EdgeInsets.only(
        top: Config.yMargin(context, 5),
        left: Config.xMargin(context, 7),
        right: Config.xMargin(context, 7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Stuff I\'ve worked on',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Config.xMargin(context, 5),
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 650,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2,
              ),
              children: projectList
                  .map(
                    (e) => ProjectPreview(project: e),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: Config.yMargin(context, 4)),
        ],
      ),
    );
  }
}
