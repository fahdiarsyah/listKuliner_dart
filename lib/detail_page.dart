import 'package:flutter/material.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/style.dart';

class DetailPage extends StatelessWidget {
  final Makanan makanan;

  const DetailPage(
    {super.key,
    required this.makanan}
    );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset(
                    makanan.gambar,
                    scale: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonBack(),
                          ButtonLike(),
                        ],
                      ),
                    )],
              ),
              Container(
                color: headerBackColor,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  makanan.nama,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                // Layout
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // icon
                children: [
                  attributesIcon(Icons.access_time_filled, makanan.waktubuka),
                  attributesIcon(Icons.local_fire_department_sharp, makanan.kalori),
                  attributesIcon(Icons.monetization_on, makanan.harga),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  makanan.detail,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),  
                ),
              ),
              listGambar(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Gambar Racikan",
                  style: textHeader1,
                ),
              ),
              listRacikan(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox listRacikan() {
    return SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: makanan.bahan.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          makanan.bahan[index].values.first,
                          width: 52,
                        ),
                        Text(makanan.bahan[index].keys.first)
                      ],
                    ),
                  );
                },
              ),
            );
  }

  SizedBox listGambar() {
    return SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: makanan.gambarlain.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(makanan.gambarlain[index])
                    ),
                  );
                },
              ),
            );
  }

  Column attributesIcon(IconData icon, String teks) {
    return Column(
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        teks,
                        style: TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtonLike extends StatefulWidget {
  const ButtonLike({
    super.key,
  });
  
  @override
  State<StatefulWidget> createState() => _ButtonLike();
}

class _ButtonLike extends State<ButtonLike> {  
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        icon: Icon(
          isSelected ? Icons.favorite : Icons.favorite_border_outlined,
          color:  Color.fromARGB(255, 205, 1, 1),
        ),
      ),
    );
  }
}
