import 'package:ama/controller/Controller.dart';
import 'package:ama/model/Session.dart';
import 'package:ama/view/components/GenericContainer.dart';
import 'package:flutter/material.dart';
import '../../constants/AppColors.dart' as AppColors;

class SessionScreen extends StatelessWidget {
  SessionScreen({this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(session.title),
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
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: GenericContainer(
                  title: session.title, text: session.type),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: GenericContainer(
                  title: session.timeString, text: session.day),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: GenericContainer(
                  title: "Location", text: session.location),
            ),
            if ((session.description != null) && session.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: GenericContainer(
                    title: "Description", text: session.description),
              ),
            if ((session.chairs != null) && session.chairs.isNotEmpty)
              Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: GenericContainer(
                        title: "Chairs",
                        text: session.chairsString,
                        touchable: true,
                      ),
                      onPressed: () async => Navigator.pushNamed(
                            context,
                            '/personScreen',
                            arguments: await Controller.instance()
                                .getPeopleWithKeys(session.chairs),
                          ))),
            if ((session.items != null) && session.items.isNotEmpty)
              Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: GenericContainer(
                        title: "Items",
                        text: "",
                        touchable: true,
                      ),
                      onPressed: () async => Navigator.pushNamed(
                            context,
                            '/itemsScreen',
                            arguments: await Controller.instance()
                                .getItemsWithKeys(session.items),
                          ))),
            Divider()
          ],
        ),
      ),
    );
  }
}
