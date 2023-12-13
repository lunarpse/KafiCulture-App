import 'package:flutter/material.dart';

class CargoDialogueBox extends StatelessWidget {
  const CargoDialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
          width: 300, height: 30, child: Text('Do You Want Now Or Deliver??')),
      actions: <Widget>[
        ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(130, 50)),
              elevation: MaterialStatePropertyAll(6),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(168, 93, 38, 1)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            onPressed: () {},
            child: Text(
              "Deliver",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
        Spacer(),
        Spacer(),
        Spacer(),
        ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(130, 50)),
              elevation: MaterialStatePropertyAll(6),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(168, 93, 38, 1)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/payment');
            },
            child: Text(
              "Now",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
