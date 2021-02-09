import 'package:constructor_buddy/model/model.dart';
import 'package:flutter/material.dart';

// import 'models.dart';

class MechanicDetail extends StatelessWidget {
  final Mechanic mechanic;

  MechanicDetail({this.mechanic});

  bodyWidget(BuildContext context) => 
      Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width - 25,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.05,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 2.0,
                  ),
                  //Text(
                  //pokemon.name,
                  // style:
                  //   TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  // ),
             
            Hero(
                tag: mechanic.avatar,
                child: Container(
                  height: 117.0,
                  width: 190.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // fit: BoxFit.cover, 
                          image: NetworkImage(mechanic.avatar))),
                )),
                  // Text("${mechanic.avatar}"),
                  Text("${mechanic.mechanic_fname}"),
                  Text("รายละเอียด : ${mechanic.mechanic_lname}"),
                   Text("รายละเอียด : ${mechanic.mechanic_phone}"),
                     Text("รายละเอียด : ${mechanic.mechanic_email}"),
                      Hero(
                tag: mechanic.mechanic_img,
                child: Container(
                  height: 117.0,
                  width: 190.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // fit: BoxFit.cover, 
                          image: NetworkImage(mechanic.mechanic_img))),
                )),
                  
                  Text("รายละเอียด : ${mechanic.mechanic_detail}"),
                  //Text("จำนวนสินค้าที่มี"+ "${pokemon.nextEvolution}"),
                  // Text("${farmer.store}"),
                  // Text("จำนวนสินค้าที่ต้องการซื้อ", style: TextStyle(fontWeight: FontWeight.bold)),
                  // TextField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder()
                  //     )
                  //   ),
/*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: farmer.weaknesses
                            .map((n) => FilterChip(
                                  backgroundColor: Colors.red,
                                  label: Text(
                                    "สั่งซื้อสินค้า",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  
                                  onSelected: (b) {},
                                ))
                                
                            .toList(),
                  )
                  */
                ],
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Hero(
          //       tag: farmer.name,
          //       child: Container(
          //         height: 190.0,
          //         width: 190.0,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 fit: BoxFit.cover,
          //                 image: FARMER_IMAGES.containsKey(farmer.cid) ?
          //                   NetworkImage(farmer_IMAGES[farmer.cid]):
          //                   NetworkImage('http://picsum.photos/200'))),
          //       )),
          // )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[300],
        title: Text(mechanic.mechanic_fname),
      ),
      body: bodyWidget(context),
    );
  }
}
