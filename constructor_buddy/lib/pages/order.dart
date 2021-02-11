import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/pages/map.dart';
import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int _value = 1;
  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: new AppBar(
          title: Text('รายการสั่งซื้อ'),
          backgroundColor: Colors.indigo[300],
          actions: <Widget>[
            // new IconButton(icon: const Icon(Icons.save), onPressed: () {})
          ],
        ),
        body: Container(
            child: Center(
                child: SingleChildScrollView(
          child: Column(
          
          children: <Widget>[
             new  Container(
                  margin: EdgeInsets.only(
                    left: 18,
                    right: 29,
                    top: 25,
                    // 68,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(
                    "ไปส่งที่",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                 ],
                ),
                ),
            const SizedBox(height: 30),

            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              color: Colors.blueAccent[100],
              child: Text(
                'แผนที่',
                style: TextStyle(color: Colors.white),
              ),
            ),
            new  Container(
                  margin: EdgeInsets.only(
                    left: 18,
                    right: 29,
                    top: 25,
                    // 68,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(
                    "สรุปคำสั่งซื้อ",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                 ],
                ),
                ),

             new  Container(
                  margin: EdgeInsets.only(
                    left: 18,
                    right: 29,
                    top: 25,
                    // 68,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(
                    "วิธีการชำระเงิน",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                 ],
                ),
                ),
              new  Container(
                margin: EdgeInsets.only(
                    left: 1,
                    right: 10,
                    top: 25,
                ),
              // padding: EdgeInsets.all(15.0),
              child: DropdownButton(
                  hint: Text("สภาพต้นข้าว"),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("เงินสด"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("โอนผ่านบัญชีธนาคาร"),
                      value: 2,
                    ),
           
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),
           new  Container(
                  margin: EdgeInsets.only(
                    left: 18,
                    right: 29,
                    top: 25,
                    // 68,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(
                    "ตัวเลือกการจัดส่ง",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                 ],
                ),
                ),
                  Container(
              padding: EdgeInsets.all(20.0),
              child: DropdownButton(
                  hint: Text("สภาพต้นข้าว"),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("ตั้งตรง"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("ราบกับพื้น"),
                      value: 2,
                    ),
                    DropdownMenuItem(child: Text("ล้ม"), value: 3),
                    // DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),

            // new ListTile(
            //   // leading: const Icon(Icons.person),
            //   title: new TextField(
            //     decoration: new InputDecoration(
            //       hintText: "จำนวนไร่ที่ต้องการเก็บเกี่ยว",
            //     ),
            //   ),
            // ),
            // new ListTile(
            //   // leading: const Icon(Icons.phone),
            //   title: new TextField(
            //     decoration: new InputDecoration(
            //       hintText: "พันธุ์ข้าว",
            //     ),
            //   ),
            // ),
             
          
            // InkWell(
            //   child: Text(_selectedDate,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(color: Color(0xFF000000))),
            //   onTap: () {
            //     _selectDate(context);
            //   },
            // ),
            // IconButton(
            //   icon: Icon(Icons.calendar_today),
            //   tooltip: 'Tap to open date picker',
            //   onPressed: () {
            //     _selectDate(context);
            //   },
            // ),
            // new ListTile(
            //   // leading: const Icon(Icons.email),
            //   title: new TextField(
            //     decoration: new InputDecoration(
            //       hintText: "อื่นๆ",
            //     ),
            //   ),
            // ),
            ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(
                onPressed: () => {},
                color: Colors.green,
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () => {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Calendar()))
                },
                color: Colors.red,
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ])
            // const Divider(
            //   height: 1.0,
            // ),
            // new ListTile(
            //   leading: const Icon(Icons.label),
            //   title: const Text('Nick'),
            //   subtitle: const Text('None'),
            // ),
            // new ListTile(
            //   leading: const Icon(Icons.today),
            //   title: const Text('Birthday'),
            //   subtitle: const Text('February 20, 1980'),
            //   trailing: const Icon(
            //     Icons.check_circle,
            //     color: Colors.green,
            //   ),
            // ),
            // new ListTile(
            //   leading: const Icon(Icons.group),
            //   title: const Text('Contact group'),
            //   subtitle: const Text('Not specified'),
            // )
          ],
        ),
      ),
        ),
        ),
    );
  }
}