import 'package:flutter/material.dart';
import 'package:list_kuliner/detail_page.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/style.dart';
import 'package:list_kuliner/http_helper.dart';

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
  final Makanan makanan;
  HttpHelper api = HttpHelper();

  ListItem(
    {super.key,
    required this.makanan,
    required this.api
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DetailPage(
              makanan: makanan,
              api: api
              ),
          ));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: decorBox(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // widget untuk menampilkan gambar lokal
              menuImage(),
              const SizedBox(width: 10),
              descText(),
              const Icon(
                Icons.food_bank_rounded,
                color: iconColor,
                size: 30,
              )
            ],
        ),
      ),
    );
  }

  BoxDecoration decorBox() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [BoxShadow(
          color: boxShadColor,
          offset: Offset(1, 2),
          blurRadius: 6)
        ]);
  }

  ClipRRect menuImage() {
    return ClipRRect(  // Menyesuaikan ukuran gambar
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              api.url + makanan.gambar,
              height: 75,
              width: 85,
              fit: BoxFit.cover,
            ),
          );
  }

  Expanded descText() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  makanan.nama,
                  style: textHeader1,
                ),
                const SizedBox(height: 7),
                Text(
                  makanan.deskripsi,
                  style: const TextStyle(color: Colors.black38),
                  overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 11),
                Text(
                  makanan.harga,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black45),
                ),
              ],
            ),
    );
  }
}