import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/post_model.dart';

class RemoteApi extends StatefulWidget {
  RemoteApi({Key key}) : super(key: key);

  @override
  _RemoteApiState createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Post post;

  Future<List<Post>> httpVeriOku() async {
    // çektiğimiz json dosyasının birden fazla verisi oldığu için bu verileri parçalayıp bir listeye aktardık. Fonksiyonda döndüreceğimiz değeri belirttik.
    var veriOku = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (veriOku.statusCode == 200) {
      return (json.decode(veriOku.body) as List)
          .map((gelenVeri) => Post.fromJson(gelenVeri))
          .toList(); // çektiğimiz json dosyasını parçalayıp oluşturmuş olduğumuz model sınfıından nesne halinde listeye aktarıyoruz.
    } else {
      throw Exception("Bağlanılamadı");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Remote Json"),
        ),
        body: Container(
          child: FutureBuilder(
            future: httpVeriOku(),
            builder: (BuildContext context, AsyncSnapshot<List<Post>> sonuc) {
              // future'ye verdiğimiz değerden gelen veriler buradaki "sonuc" isimli değişkene geleir
              if (sonuc.hasData) {
                // sonucun içinde veri olması halinde yapılacak işlemler burada yazılır.
                return ListView.builder(
                  itemCount: sonuc.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(sonuc.data[index].title),
                        leading: CircleAvatar(
                          child: Text(sonuc.data[index].id.toString()),
                        ));
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
