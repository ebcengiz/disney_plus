import 'package:carousel_slider/carousel_slider.dart';
import 'package:disney_plus/data/entity/filmler.dart';
import 'package:disney_plus/data/entity/kategori.dart';
import 'package:disney_plus/ui/views/detay_sayfa.dart';
import 'package:disney_plus/ui/views/proje_renkler.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Film>> filmleriYukle() async{
    var filmlerListesi = <Film>[];
    var f1 = Film(id: 1, ad: "Anagörsel", resimAd: "anagorsel.png");
    var f2 = Film(id: 2, ad: "Avengers", resimAd: "avengers.png");
    var f3 = Film(id: 3, ad: "Thor", resimAd: "thor.png");
    var f4 = Film(id: 4, ad: "Loki", resimAd: "loki.png");
    var f5 = Film(id: 5, ad: "TrueLies", resimAd: "truelies.png");
    var f6 = Film(id: 6, ad: "Avatar", resimAd: "avatar.png");
    var f7 = Film(id: 7, ad: "L-pop", resimAd: "l-pop.png");
    var f8 = Film(id: 8, ad: "Obi", resimAd: "obi.png");
    var f9 = Film(id: 9, ad: "Moon", resimAd: "moon.png");
    var f10 = Film(id: 10, ad: "Wanda", resimAd: "wanda.png");
    var f11 = Film(id: 11, ad: "Örümcek Adam", resimAd: "orumcekadam.png");

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    filmlerListesi.add(f7);
    filmlerListesi.add(f8);
    filmlerListesi.add(f9);
    filmlerListesi.add(f10);
    filmlerListesi.add(f11);
    return filmlerListesi;
  }

  Future<List<Kategori>> kategoriYukle() async{

    var kategoriListesi = <Kategori>[];
    var k1 = Kategori(id: 1, ad: "Disney", resimAd: "disney.png");
    var k2 = Kategori(id: 2, ad: "Marvel", resimAd: "marvel.png");
    var k3 = Kategori(id: 3, ad: "Star Wars", resimAd: "starw.png");
    var k4 = Kategori(id: 4, ad: "Pixar", resimAd: "pixar.png");

    kategoriListesi.add(k1);
    kategoriListesi.add(k2);
    kategoriListesi.add(k3);
    kategoriListesi.add(k4);
    return kategoriListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackColor,
        flexibleSpace: Center(
          child: Image.asset("resimler/disneylogoson.png"),
        ),
      ),
      backgroundColor: appBarBackColor,
      body: SingleChildScrollView(
        child: FutureBuilder<List<Film>>(
          future: filmleriYukle(),
          builder: (context, filmSnapshot) {
            if (filmSnapshot.hasData) {
              var filmlerListesi = filmSnapshot.data;

              // İlk 3 film resmi
              var ilkUcResim = filmlerListesi!.take(3).toList();

              return Column(
                children: [
                  CarouselSlider(
                    items: ilkUcResim.map((film) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetaySayfa(film: film,)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Image.asset("resimler/${film.resimAd}"),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayInterval: Duration(seconds: 5),
                      enableInfiniteScroll: true,
                      pauseAutoPlayOnTouch: true,
                      enlargeCenterPage: true,
                    ),
                  ),

                  SizedBox(height: 20), // Resimler arasına boşluk ekleyebilirsiniz

                  // Kategori listesi
                  FutureBuilder<List<Kategori>>(
                    future: kategoriYukle(),
                    builder: (context, kategoriSnapshot) {
                      if (kategoriSnapshot.hasData) {
                        var kategoriListesi = kategoriSnapshot.data;

                        // İlk 3 kategori resmi
                        var ilkDortKategori = kategoriListesi!.take(4).toList();

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: ilkDortKategori.map((kategori) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("resimler/${kategori.resimAd}"),
                            );
                          }).toList(),
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),

                  FutureBuilder<List<Film>>(
                    future: filmleriYukle(),
                    builder: (context, filmSnapshot) {
                      if (filmSnapshot.hasData) {
                        var filmlerListesi = filmSnapshot.data;

                        var filmlerF8denF11ye = filmlerListesi!.skip(7).take(4).toList();

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 285, 10),
                              child: Text("Disney+'ta Yeni", style: TextStyle(color: yaziRenk, fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                            Row(
                              children: filmlerF8denF11ye.map((film) {
                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DetaySayfa(film: film,)),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("resimler/${film.resimAd}"),
                                          SizedBox(height: 5), // Görseller arasına boşluk ekleyebilirsiniz
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),

                  FutureBuilder<List<Film>>(
                    future: filmleriYukle(),
                    builder: (context, filmSnapshot) {
                      if (filmSnapshot.hasData) {
                        var filmlerListesi = filmSnapshot.data;

                        var filmlerF4denF7ye = filmlerListesi!.skip(3).take(4).toList();

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 250, 10),
                              child: Text("Sana Özel Öneriler", style: TextStyle(color: yaziRenk, fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                            Row(
                              children: filmlerF4denF7ye.map((film) {
                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DetaySayfa(film: film,)),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("resimler/${film.resimAd}"),
                                          SizedBox(height: 5), // Görseller arasına boşluk ekleyebilirsiniz
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ],
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
