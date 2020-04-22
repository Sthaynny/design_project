import 'package:design_project/screens/home/home_repository.dart';
import 'package:design_project/screens/home/widgets/contact_tile/contact_tile_widget.dart';
import 'package:design_project/screens/home_bloc.dart';
import 'package:design_project/shared/models/contact_model.dart';
import 'package:design_project/shared/services/custom_dio/custom_dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bloc = HomeBloc(HomeRepository(CustomDio()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getContacts();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<ContactModel>>(
        stream: bloc.contactsOut,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Column(
              children: snapshot.data
                  .map(
                    (i) => ContactTileWidget(
                      snapshot: i,
                    ),
                  )
                  .toList(),
            );
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
