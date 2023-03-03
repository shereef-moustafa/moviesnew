import 'package:flutter/material.dart';
import 'package:moviesnew/simmiler/similer_single_category.dart';

import '../../models/GenresRes.dart';
import '../Single_category/single_category.dart';

class similerCategory_item extends StatelessWidget{
  Genres category;

  similerCategory_item(this.category);
  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap:(){
       Navigator.pushNamed(context, similerSingleCategory.routename , arguments:category );
     } ,
     child: Container(
       width: 158,
       height: 90,
       child: Stack(alignment: Alignment.center,
         children: [
           Image.asset('assets/images/category_bg.png' , ),
           Text(category.name!, style: TextStyle(color: Colors.white , fontSize: 14, fontWeight: FontWeight.w600),),
         ],
       ),
     ),
   );
  }

}