import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/araba_model.dart';

class LocalJson extends StatefulWidget {
  LocalJson({Key key}) : super(key: key);

  @override
  _LocalJsonState createState() => _LocalJsonState();
}

List<Araba>  tumarabalar;

class _LocalJsonState extends State<LocalJson> {
  

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Local JSON"), 


      
      ),
          body: Container(

 /* tumarabalar != null   // list wiew builder kullanılarak gösterim biçimi
              ? Center(
                  child: Container(
                    child: ListView.builder(
                      itemCount: tumarabalar.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(tumarabalar[index]["marka"]),
                          subtitle: Text(tumarabalar[index]["ulke"]),
                        );
                      },
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
          
                ), */


         child: FutureBuilder(
            //future builder uzun sürecek işlemler d
            future:
                verikaynaginiOku(), // future kısmında veriyi okuduğumuz kısım oluyor.

            builder: (BuildContext context, sonuc) {
              // builderda future kısmına veridiğimiz fonksiyonun sonucu "sonuc" isimli değişkene atanır.
              if (sonuc.hasData) {  // eğer sonuc değişkeninde data varsa 
                tumarabalar = sonuc.data; // oluşturduğumuz dizinin içine gelen verileri attıyoruz
                return ListView.builder(
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: Text(tumarabalar[index].marka),
                      subtitle: Text(tumarabalar[index].marka),
                    );
                  },
                  itemCount: tumarabalar.length,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
      ),
    );
  }


Future<List<Araba>> verikaynaginiOku() async {
    var jsonOku = await DefaultAssetBundle.of(context)
        .loadString("assets/data/model.json");
    debugPrint(jsonOku);

    List<Araba> jsonParcala = (json.decode(jsonOku) as List)
        .map((mapYapisi) => Araba.fromJson(mapYapisi))
        .toList();

    for (var i = 0; i < jsonParcala.length; i++) {
      debugPrint(jsonParcala[i].ulke.toString());
    }

    return jsonParcala;
  }

}