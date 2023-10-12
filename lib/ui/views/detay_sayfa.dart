import 'package:disney_plus/data/entity/filmler.dart';
import 'package:disney_plus/ui/views/proje_renkler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Film film;
  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white70),
        backgroundColor: appBarBackColor,
        flexibleSpace: Center(
          child: Image.asset("resimler/disneylogoson.png", height: 60), // Görselin yüksekliğini ayarlayın
        ),
        title: Text(widget.film.ad, style: TextStyle(color: Colors.white70),
        ),
        toolbarHeight: 80, // AppBar'ın yüksekliğini ayarlayın
      ),

      backgroundColor: appBarBackColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.resimAd}"),
          ],
        ),
      ),
    );
  }
}
