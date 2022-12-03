import 'package:flutter/material.dart';
import 'package:calculator/ui/ui_drawer.dart';

class UICalculator extends StatefulWidget {
  const UICalculator({Key? key}) : super(key: key);

  @override
  State<UICalculator> createState() => _UICalculatorState();
}

class _UICalculatorState extends State<UICalculator> {

  String text_operation = "2*5";
  String text_result = "";
  int max_size_operation = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Calculator"),
        ),
        elevation: 0,
      ),
      drawer: const UIDrawer(),
      body: uiBody(context),
    );
  }

  Widget uiBody(BuildContext context){
    return Column(
      children: [
        head(context),
        body(context),
      ],
    );
  }

  Widget head(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text_operation,
            style: const TextStyle(
              fontSize: 30
            ),
          ),
          Text(
            text_result,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 80
            ),
          )
        ],
      ),
    );
  }

  Widget body(BuildContext ctx){
    return Expanded(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Row(
              children: [
                button(ctx, "C", color: Colors.deepOrange, isClear: true),
                button(ctx, "B", color: Colors.deepOrange, isDelet: true),
                button(ctx, "%", color: Colors.deepOrange),
                button(ctx, "/", color: Colors.deepOrange)],
            ),
            Row(children: [
              button(ctx, "7"),
              button(ctx, "8"),
              button(ctx, "9"),
              button(ctx, "x", color: Colors.deepOrange)
            ],),
            Row(children: [
              button(ctx, "4"),
              button(ctx, "5"),
              button(ctx, "6"),
              button(ctx, "-", color: Colors.deepOrange)
            ],),
            Row(children: [
              button(ctx, "1"),
              button(ctx, "2"),
              button(ctx, "3"),
              button(ctx, "+", color: Colors.deepOrange)
            ],),
            Row(children: [
              button(ctx, ""),
              button(ctx, "0"),
              button(ctx, "."),
              button(ctx, "=", color: Colors.deepOrange, isEqual: true)
            ],),
          ],
        ),
      ),
    );
  }

  Widget button(
    BuildContext context,
    String number,
    {
      Color color: Colors.white,
      bool isClear: false,
      bool isDelet: false,
      bool isEqual: false,
    }
    ){
    double margin = 10;
    double width_box = (MediaQuery.of(context).size.width * 0.25) - (margin * 2);
    return GestureDetector(
      child: Container(
        height: width_box,
        width: width_box,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(width_box / 2)
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 50,
              color: color
            ),
          )
        ),
      ),
      onTap: (){
          if(isClear){
            text_result = "";
          } else if(isDelet){
            try{
              text_result = text_result.substring(0, text_result.length-1);
            }catch(error){

            }
          } else if(isEqual){

          } else if((text_result + number).length <= max_size_operation){
            text_result += number;
          }
          setState(() {
          });
      },
    );
  }

}
