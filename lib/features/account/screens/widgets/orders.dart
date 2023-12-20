import 'package:amazonclone/constants/global_variable.dart';
import 'package:amazonclone/features/account/screens/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //temp list
  List list = [
    "https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBjfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBjfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBjfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBjfGVufDB8fDB8fHww",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 18,
                  color: GolbalVariables.selectedNavBarColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            //display orders
          ],
        ),
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return SingleProduct(image: list[index]);
            }),
          ),
        ),
      ],
    );
  }
}
