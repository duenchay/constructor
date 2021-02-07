import 'dart:convert';
// import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/pages/productDetail.dart';
import 'package:constructor_buddy/pages/mechanicDetail.dart';
// import 'package:constructor_buddy/pages/detail.dart';
// import 'package:constructor_buddy/pages/productdetail.dart';
// import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'models.dart';
// import 'product_detail.dart';

class Mechanics extends StatefulWidget {
  final int id;

  Mechanics(this.id);

  @override
  _MechanicsState createState() {
    print('creating state');
    return new _MechanicsState();
  }

  static fromJson(data) {}
}

class _MechanicsState extends State<Mechanics> {
  // var url = "https://jungqueue.pythonanywhere.com/api/farmer/1";

  // เอารายชื่อของ farmer มาทั้งหมด
  List<Mechanic> _mechanics = <Mechanic>[];
  

  @override
  void initState() {
    super.initState();
    print('fetching data');
    getMechanics();
  }

  /*
  void getFarmerInfo() async {
    print('calling getFarmerInfo(${widget.farmerId})');
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    dynamic result = json.decode(utf8.decode(response.bodyBytes));
    print('stream is done.');
    print('${result}');
    Farmer farmer1 = Farmer.fromMap(result);
    print('${farmer1}');
    _farmer = farmer1;
    setState(() {});
  }
  fetchData() async {
    final Stream<Farmer> stream = await getFarmers();
    stream.listen((Farmer farmer) => setState(() => _farmer.add(farmer)));
  }
  */

  void getMechanics() async {
    print('calling getMechanics()');
    String url = 'https://constructor.pythonanywhere.com/api/Mechanic/';
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
    _mechanics = result.map<Mechanic>((data) => Mechanic.fromMap(data)).toList();
    setState(() {});
  }
  Widget build(BuildContext context) {
    print('update FarmerPage');
    //print('${_products}');
    return MaterialApp(
      title: 'First Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ช่างรับเหมาก่อสร้าง'),
        ),
        body: _mechanics.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: _mechanics
                    .map((mechanic) => Card(
                        child: ListTile(
                            leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage("${mechanic.avatar}"),
                backgroundColor: Colors.transparent,
              ),
                            title: Text(mechanic.mechanic_fname),
                            subtitle: Text("${mechanic.mechanic_lname}"),
                            // trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MechanicDetail(
                                            mechanic: mechanic,
                                          )));
                            })))
                    .toList(),
              ),
      ),
    );
  }
}
