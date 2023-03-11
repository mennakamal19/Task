import 'package:flutter/material.dart';
import 'package:task/order_details_screen.dart';
import 'package:task/shared/shared_components.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context,idx) => taskItem(),
              separatorBuilder: (context,idx) => const Divider(),
              itemCount: 4
          ),
        ),
      ),
    );
  }
  Widget taskItem() =>InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const OrderDetailsScreen()));
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text('',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
            Row(
              children: [
                defaultText('Order number: '),
                const Text('1200')
              ],
            ),
            Row(
              children:  [
                defaultText('Address: '),
                const Text('16 Abu Elfada, zamalek, Cairo')
              ],
            )
          ],
        ),
      ),
    ),
  );
}
