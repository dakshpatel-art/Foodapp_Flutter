import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoody/provider/my_provider.dart';
import 'package:zoody/screen/Widget/HomePage.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final int price;
  final String name;

  DetailPage({required this.image, required this.name, required this.price});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Myprovider provider = Provider.of<Myprovider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: CircleAvatar(
              radius: 110,
              backgroundImage: NetworkImage(widget.image),
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff3a3e3e),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        )),
                    Text(
                      "Recommanded",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity--;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.add),
                            ),
                            Text(
                              "\$${widget.price}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("Description",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "The customer app helps the customer to access the online food ordering platforms, search for the right restaurant or the dish they want to order, place their orders and pay easily",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: Color(0xff2b2b2b),
                        onPressed: () {
                          provider.addTOCart(
                              image: widget.image,
                              name: widget.name,
                              price: widget.price,
                              quantity: 123);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Add to Cart",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
