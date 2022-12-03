import 'package:flutter/material.dart';
import 'package:calculator/ui/ui_drawer.dart';

class UICalculator extends StatefulWidget {
  const UICalculator({Key? key}) : super(key: key);

  @override
  State<UICalculator> createState() => _UICalculatorState();
}

class _UICalculatorState extends State<UICalculator> {
  String text_operation = "2*5";
  String text_result = "10";

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

  Widget uiBody(BuildContext context) {
    return Column(
      children: [
        head(context),
        body(context),
      ],
    );
  }

  Widget head(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text_operation,
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            text_result,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
          )
        ],
      ),
    );
  }

  Widget body(BuildContext ctx) {
    return Expanded(
      child: Container(
        color: Colors.deepOrange,
        child: Column(
          children: [
            Row(
              children: [
                button(ctx, "1"),
                button(ctx, "2"),
                button(ctx, "1"),
                button(ctx, "2")
              ],
            ),
            Row(
              children: [button(ctx, "1"), button(ctx, "2")],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(BuildContext context, String number) {
    double margin = 10.0;
    return GestureDetector(
      child: Container(
        height: (MediaQuery.of(context).size.width * 0.25) - (margin * 2),
        width: (MediaQuery.of(context).size.width * 0.25) - (margin * 2),
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
        )),
      ),
      onTap: () {
        text_result += number;
        setState(() {});
      },
    );
  }
}
