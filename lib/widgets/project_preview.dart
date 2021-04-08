import 'package:abraraltaf/models/projects.dart';
import 'package:abraraltaf/util/config.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter_icons/flutter_icons.dart';

class ProjectPreview extends StatelessWidget {
  final Project project;
  ProjectPreview({@required this.project});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          html.window.open(project.link, '');
        },
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: GridTile(
            child: Image.asset(
              project.image,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black.withOpacity(0.6),
              title: Text(
                project.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: Config.xMargin(context, 4),
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    project.description,
                    style: TextStyle(
                      fontSize: Config.xMargin(context, 2.3),
                      height: 1.0,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
              trailing: TextButton.icon(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                label: (project.id == 1 || project.id == 2)
                    ? Text('Google Playstore')
                    : Text('GitHub'),
                icon: (project.id == 1 || project.id == 2)
                    ? Icon(MaterialCommunityIcons.google_play)
                    : Icon(
                        MaterialCommunityIcons.github_circle,
                        size: Config.xMargin(context, 5),
                      ),
                onPressed: () {
                  html.window.open(project.link, '');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
