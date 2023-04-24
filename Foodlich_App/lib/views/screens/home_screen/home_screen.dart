import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 185,
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset("assets/food/1.png");
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:const  [
              Text ('Featured Partners') ,
              Text ('See all') ,
            ],),

            Column(
              children: [
                Container(),
                const Text("Daylight Coffee"),
                Text("Colarodo, San Francisco" , style: Theme.of(context).textTheme.bodyText1,),
                Row(children:const [
                  Chip(label: Text("4.5") , ),
                  Text('25min'),
                  Text('Free delivery'),

                ],)
              ],
            )
          ],

        ),
        );
  }
}
