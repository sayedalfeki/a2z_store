import 'package:flutter/material.dart';
import '../colors/color.dart';
import '../styles/styles.dart';
import 'custome_container.dart';
class CounterWidget extends StatefulWidget {
   CounterWidget({super.key,required this.valueNotifier});
 // final void Function(int value)? onChanged;
  ValueNotifier<int> valueNotifier;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.valueNotifier.addListener(() {
      setState(() {

      });
    },);
  }
  @override
  Widget build(BuildContext context) {
     return CustomContainer(
      margin: 0,
      height: 50,
      radius: 50,
      color: AppColor.mainColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              widget.valueNotifier.value--;
              // counter--;
              // if(widget.onChanged!=null) {
              //   widget.onChanged!(counter);
              // }
              // setState(() {});
            },
            child: Container(
              // alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.whiteColor, width: 2),
                borderRadius: BorderRadius.circular(30),
                //color: AppColor.whiteColor
              ),
              child: Transform.translate(
                offset: Offset(0, -8),
                child: Icon(Icons.minimize_rounded, color: AppColor.whiteColor),
              ),
            ),
          ),
          Spacer(),
          Text('${widget.valueNotifier.value}', style: AppStyle.whiteNormal15),
          Spacer(),
          GestureDetector(
            onTap: () {
              widget.valueNotifier.value++;
              // counter++;
              // if(widget.onChanged!=null) {
              //   widget.onChanged!(counter);
              // }
              //  setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.whiteColor, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(Icons.add, color: AppColor.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
