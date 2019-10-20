import 'package:ama/components/SessionContainer.dart';
import 'package:ama/data/DaySessionsInfo.dart';
import 'package:flutter/material.dart';
import '../constants/AppColors.dart' as AppColors;

class DaySessionsScreen extends StatelessWidget {
  DaySessionsScreen({this.sessionsInfo});

  final DaySessionsInfo sessionsInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text("Sessions for  " + sessionsInfo.getDate().toString()),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
            color: AppColors.backgroundColor,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                itemCount: sessionsInfo.getSessions().length,
                itemBuilder: (context, idx) {
                  return FlatButton(
                    onPressed: () {
                      sessionsInfo.addFunction(sessionsInfo.getSessions().elementAt(idx));
                      Navigator.of(context).pop();
                    },
                    child: SessionContainer(
                      activity: sessionsInfo.getSessions().elementAt(idx),
                    ),
                  );
                })));
  }
}
