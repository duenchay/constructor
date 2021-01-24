import 'package:constructor_buddy/model/cases.dart';
import 'package:constructor_buddy/services/api_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_restapi/services/api_service.dart';
// import 'models/cases.dart';

enum Producttype { type1, type2 ,type3 , type4}
enum Productstatus { status1, status2}


class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _detailController = TextEditingController();
  final _imgController = TextEditingController();
  String producttype = 'เครื่องมือไฟฟ้า';
  // ignore: unused_field
  Producttype _producttype = Producttype.type1;
  final _amountController = TextEditingController();
  String productstatus = 'positive';
  // ignore: unused_field
  Productstatus _productstatus = Productstatus.status1;

  @override
  void initState() {
    id = widget.cases.id;
    _nameController.text = widget.cases.product_name;
    _priceController.text = widget.cases.product_price.toString();
    _detailController.text = widget.cases.product_detail;
    _imgController.text = widget.cases.product_img;
    _amountController.text = widget.cases.product_amount.toString();
    producttype = widget.cases.product_type;
    if(widget.cases.product_type == 'เครื่องมือไฟฟ้า') {
      _producttype = Producttype.type1;
    } else if (widget.cases.product_type == 'เครื่องมือไฟฟ้า') { 
      _producttype = Producttype.type2;
    } else if (widget.cases.product_type == 'อุปกรณ์ยึดติด') {
      _producttype = Producttype.type3;
    } else {
      _producttype = Producttype.type4;
    }
    productstatus = widget.cases.product_status;
    if(widget.cases.product_status == 'คงเหลือ') {
      _productstatus = Productstatus.status1;
    } else {
      _productstatus = Productstatus.status2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Cases'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('ชื่อ'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'ชื่อ',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('ราคา'),
                              TextFormField(
                                controller: _priceController,
                                decoration: const InputDecoration(
                                  hintText: 'ราคา',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter price';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('รายละเอียด'),
                              TextFormField(
                                controller: _detailController,
                                decoration: const InputDecoration(
                                  hintText: 'รายละเอียด',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter detail';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                         Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('จำนวน'),
                              TextFormField(
                                controller: _amountController,
                                decoration: const InputDecoration(
                                  hintText: 'จำนวน',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter amount';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('หมวดหมู่สินค้า'),
                              ListTile(
                                title: const Text('เครื่องมือไฟฟ้า'),
                                leading: Radio(
                                  value: Producttype.type1,
                                  groupValue: _producttype,
                                  onChanged: (Producttype value) {
                                    setState(() {
                                      _producttype = value;
                                      producttype = 'เครื่องมือไฟฟ้า';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('เครื่องมือช่าง'),
                                leading: Radio(
                                  value: Producttype.type2,
                                  groupValue: _producttype,
                                  onChanged: (Producttype value) {
                                    setState(() {
                                      _producttype = value;
                                      producttype = 'เครื่องมือช่าง';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('อุปกรณ์ยึดติด'),
                                leading: Radio(
                                  value: Producttype.type3,
                                  groupValue: _producttype,
                                  onChanged: (Producttype value) {
                                    setState(() {
                                      _producttype = value;
                                      producttype = 'อุปกรณ์ยึดติด';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('วัสดุเทพื้น'),
                                leading: Radio(
                                  value: Producttype.type4,
                                  groupValue: _producttype,
                                  onChanged: (Producttype value) {
                                    setState(() {
                                      _producttype = value;
                                      producttype = 'วัสดุเทพื้น';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                     
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('สถานะสินค้า'),
                              ListTile(
                                title: const Text('คงเหลือ'),
                                leading: Radio(
                                  value: Productstatus.status1,
                                  groupValue: _productstatus,
                                  onChanged: (Productstatus value) {
                                    setState(() {
                                      _productstatus = value;
                                      productstatus = 'คงเหลือ';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Dead'),
                                leading: Radio(
                                  value: Productstatus.status2,
                                  groupValue: _productstatus,
                                  onChanged: (Productstatus value) {
                                    setState(() {
                                      _productstatus = value;
                                      productstatus = 'dead';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    api.updateCases(id, Cases(product_name: _nameController.text, 
                                    product_price: double.parse(_priceController.text),
                                    product_detail: _detailController.text, 
                                    product_img: _imgController.text, 
                                    product_amount: int.parse(_amountController.text),
                                    product_type: producttype, 
                                    product_status: productstatus));
                            

                                    Navigator.pop(context) ;
                                  }
                                },
                                child: Text('Save', style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }

}