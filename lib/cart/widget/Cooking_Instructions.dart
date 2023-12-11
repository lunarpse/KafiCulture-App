import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_2/cart/riverpod/tipstate_provider.dart';

import '../../constants/color_constants.dart';

import '../../constants/text_constants.dart';

class Cooking_Instructions extends ConsumerStatefulWidget {
  const Cooking_Instructions({super.key});

  @override
  ConsumerState<Cooking_Instructions> createState() => _Cooking_InstructionsState();
}

class _Cooking_InstructionsState extends ConsumerState<Cooking_Instructions> {
  final instruct_controller=TextEditingController(text:"");
  var text="";
  @override
  Widget build(BuildContext context) {
    final instruction=ref.read(TipProvider)["instructions"];
    print(instruction);
    return Container(
          width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
       color: cookinginstructionboxdecorationcolor,
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            color: cookinginstructionboxshadowcolor,
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child:  ExpansionTile(
      onExpansionChanged: (value) {
        
      },
       textColor:cookinginstructiontextcolor,
       childrenPadding: EdgeInsets.only(left: 10,right: 10,bottom: 20),
        
        title: Text(cookinginstruction,
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        children: [
          
             Container(
              margin:EdgeInsets.only(left: 15,right: 15,bottom: 8) ,
               child: TextFormField(
                
              initialValue: ref.watch(TipProvider)["instructions"],
              onChanged: (value) {
                ref.watch(TipProvider.notifier).addinstruction(value);
              },
               // controller: instruct_controller,
                
             //   cursorColor: Color.fromARGB(255, 105, 73, 14),
                cursorHeight:CircularProgressIndicator.strokeAlignCenter,
                cursorColor: cookinginstructioncursorcolor,
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,fontStyle: FontStyle.normal),
                decoration: InputDecoration(
                  
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: cookinginstructionbordercolor)
                  ),
                  focusedBorder: UnderlineInputBorder(
                  
                    borderSide: BorderSide(color:cookinginstructionbordercolor)
                  )
                ),
            
                  
                         ),
             ),
          
        ],
      ),

    );
  }
}