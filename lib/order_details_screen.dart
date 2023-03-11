import 'package:flutter/material.dart';
import 'package:task/shared/shared_components.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,size: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white),
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children:  [
                    defaultText('Num: 1200'),
                    defaultText('Menna Kamal'),
                    defaultText('0111155899'),
                    defaultText('16 Abu Elfada, zamalek, Cairo'),
                  ],
                ),
              )
            ),
            const SizedBox(height: 16.0,),
            defaultText('Order Summary'),
            Row(
              children:const <Widget> [
                Text('Fridge'),
                SizedBox(width: 3,),
                Text('X ''1'),
                Spacer(),
                Text('23,600'),
              ],
            ),
            const Spacer(),
            Row(
              children: <Widget> [
                Expanded(
                  child:defaultText('Total'),
                ),
                defaultText('23,600 EG'),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                    defaultButton(text:'Delivered',
                        function: (){})
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:defaultButton(text:'Return',
                        function: (){})
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

