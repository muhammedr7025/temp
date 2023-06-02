import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    //  crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        SizedBox(height: 20,),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            width: 40,
            height: 40,
            child: MaterialButton(
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.black12,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text("A"),
              color: Colors.yellowAccent,
              textColor: Colors.black,
              onPressed: (){},
            ),
          ),
          SizedBox(width: 30),
          Container(
            width: 40,
            height: 40,
            child: MaterialButton(
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.black12,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text("B"),
              color: Colors.yellowAccent,
              textColor: Colors.black,

              onPressed: (){},
            ),
          ),
        ],),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            width: 40,
            height: 40,
            child: MaterialButton(
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.black12,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text("C"),
              color: Colors.yellowAccent,
              textColor: Colors.black,
              onPressed: (){},
            ),
          ),
          SizedBox(width: 30),
          Container(
            width: 40,
            height: 40,
            child: MaterialButton(
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.black12,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text("D"),
              color: Colors.yellowAccent,
              textColor: Colors.black,
              onPressed: (){},
            ),
          ),
        ],)

      ],
    );
  }
}
