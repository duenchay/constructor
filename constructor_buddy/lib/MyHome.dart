import 'package:constructor_buddy/adddatawidget.dart';
import 'package:constructor_buddy/caseslist.dart';
import 'package:constructor_buddy/model/cases.dart';
import 'package:constructor_buddy/services/api_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  List<Cases> casesList;

  @override
  Widget build(BuildContext context) {
    if(casesList == null) {
      casesList = List<Cases>();
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
              future: loadList(),
              builder: (context, snapshot) {
                return casesList.length > 0? new CasesList(cases: casesList):
                new Center(child:
                // ignore: deprecated_member_use
                new Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.title));
              },
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future loadList() {
    Future<List<Cases>> futureCases = api.getCases();
    futureCases.then((casesList) {
      setState(() {
        this.casesList = casesList;
      });
    });
    return futureCases;
  }

  _navigateToAddScreen (BuildContext context) async {
    // ignore: unused_local_variable
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDataWidget()),
    );
  }
}