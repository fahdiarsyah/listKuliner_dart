import 'package:flutter/material.dart';
import 'package:list_kuliner/list_item.dart';
import 'package:list_kuliner/makanan.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Makanan> listMenu = Makanan.listMakanan;

    return SafeArea(
      child: Column(children: [
        SizedBox(
          height: 10
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.list_alt_sharp, 
              size: 30
              ),
            Text(
              'List Kuliner',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              )
        ]),
        SizedBox(height: 10),
        Expanded(child: ListView.builder(
          itemCount: listMenu.length,
          itemBuilder: (context, index) {
            return ListItem(menu:   listMenu[index]);
          },
        ))
      ]),
    );
  }
}