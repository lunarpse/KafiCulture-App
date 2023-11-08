import 'package:flutter/material.dart';

class Cooking_Instructions extends StatefulWidget {
  const Cooking_Instructions({super.key});

  @override
  State<Cooking_Instructions> createState() => _Cooking_InstructionsState();
}

class _Cooking_InstructionsState extends State<Cooking_Instructions> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
       color: Color.fromARGB(255, 247, 238, 238),
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child:  ExpansionTile(
       
       textColor: Colors.black,
        
        title: Text("Add Cooking Instructions",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        children: [
          
             Container(
              margin:EdgeInsets.only(left: 15,right: 15,bottom: 15) ,
               child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  )
                ),
            
                  
                         ),
             ),
          
        ],
      ),

    );
  }
}