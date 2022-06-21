import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:myknott/Views/ApiClient.dart';

import '../model/Lead.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    apiClient.postData(getLeadList, getLeadError);
  }

  int currentSongIndex = 0;
  dynamic error;
  List<Lead> leads = [];
  ApiClient apiClient = ApiClient();

  getLeadList(List<Lead> leads) {
    this.leads = leads;
    setState(() {});
  }

  getLeadError(dynamic error) {
    this.error = error;
    setState(() {});
  }

  Center _showLoading() {
    return Center(child: CircularProgressIndicator());
  }

  _printLeads(Size deviceSize) {
    return Container(
      height: deviceSize.height - 200,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: leads.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              //height: 90,
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              width: deviceSize.width,
              margin: EdgeInsets.all(2),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Wrap(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name - ${leads[index].name} ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(' Email - ${leads[index].email} ',
                            style: TextStyle(fontSize: 18)),
                        Text(
                          ' Phone Number - ${leads[index].phoneNumber} ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                )
              ]),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 234, 232),
        appBar: AppBar(
          title: Text(
            "Leads",
            style: TextStyle(color: Color.fromARGB(255, 67, 66, 66)),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [_printLeads(deviceSize)],
        ));
  }
}
