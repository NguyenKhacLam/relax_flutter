import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:relax/src/models/category.dart';
import 'package:relax/src/pages/category_page.dart';

class CategoryBlock extends StatelessWidget {
  final Category category;

  CategoryBlock({this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(category: category,)));
      },
      child: Container(
              decoration: BoxDecoration(
              color: HexColor(category.color),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(category.name, style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),)
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/${category.icon}.svg'),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
