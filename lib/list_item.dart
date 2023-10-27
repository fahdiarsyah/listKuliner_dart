import 'package:flutter/material.dart';
import 'package:list_kuliner/detail_page.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/style.dart';

class ListItem extends StatelessWidget {
  // final String nama;
  // final String detail;
  // final String deskripsi;
  // final String gambar;
  // final String waktubuka;
  // final String harga;
  // final String kalori;
  // final List<String> gambarlain;
  // final List<Map<String, String>> bahan;
  final Makanan menu;

  const ListItem(
    {super.key,
    required this.menu,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailPage(makanan: menu,),));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(
            color: boxShadColor,
            offset: Offset(1, 2),
            blurRadius: 6)
          ]),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // widget untuk menampilkan gambar lokal
              menuImage(),
              SizedBox(width: 10),
              descText(),
              Icon(
                Icons.food_bank_rounded,
                color: iconColor,)
            ],
        ),
      ),
    );
  }

  ClipRRect menuImage() {
    return ClipRRect(  // Menyesuaikan ukuran gambar
            child: Image.asset(
              menu.gambar,
              height: 75,
              width: 85,
              fit: BoxFit.cover,
              ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          );
  }

  Expanded descText() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.nama,
                  style: textHeader1,
                  
                ),
                SizedBox(height: 7),
                Text(
                  menu.deskripsi,
                  style: TextStyle(color: Colors.black38),
                  overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 11),
                Text(
                  menu.harga,
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
    );
  }
}