import 'package:anjumali/Controller/Datacontorller.dart';
import 'package:anjumali/FirebaseConstant/FirebaseCredentials.dart';
import 'package:anjumali/commonWidgets/list.dart';
import 'package:anjumali/constanst.dart';
import 'package:anjumali/screens/convesationScreen.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final DataController _dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                StreamBuilder(
                    stream: firestore.collection("user").snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshots) {
                      if (!snapshots.hasData) {
                        return Center(
                          child: CircularProgressIndicator(color: Colors.red),
                        );
                      } else if (snapshots.data!.docs.isEmpty) {
                        return Center(child: Text("empty collecion"));
                      } else {
                        var data = snapshots.data!.docs[0];
                        var v = _dataController.updateData(data);

                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                                  height: 50,
                                  child: Row(children: [
                                    Icon(Icons.person_outline),
                                    5.widthBox,
                                    "${data['name']}".text.bold.center.make(),
                                  ]))
                              .box
                              .color(Colors.grey.shade100)
                              .outerShadow
                              .padding(EdgeInsets.only(left: 10))
                              .rounded
                              .make(),
                        );
                      }
                    }),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 400),
                    child: ListView.separated(
                      itemCount: leftScreenList.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.white,
                      ),
                      itemBuilder: (context, index) {
                        final button = leftScreenList[index];
                        return ListTile(
                          leading: Icon(button.icon, color: Colors.white),
                          title: Text(
                            button.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: button.onpress,
                        );
                      },
                    ).box.black.make(),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 2,
            color: Colors.black,
          ),
          Expanded(
            flex: 3,
            child: Container(color: Colors.blue, child: ChatScreen()),
          ),
        ],
      ),
    );
  }
}
