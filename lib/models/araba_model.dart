class Araba {
  String marka;
  String ulke;
  int kurulusTarihi;
  List<Model> model;

  Araba({this.marka, this.ulke, this.kurulusTarihi, this.model});

  Araba.fromJson(Map<String, dynamic> json) {
    marka = json['marka'];
    ulke = json['ulke'];
    kurulusTarihi = json['kurulus_tarihi'];
    if (json['model'] != null) {
      model = new List<Model>();
      json['model'].forEach((v) {
        model.add(new Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marka'] = this.marka;
    data['ulke'] = this.ulke;
    data['kurulus_tarihi'] = this.kurulusTarihi;
    if (this.model != null) {
      data['model'] = this.model.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Model {
  String arabaModel;
  int fiyati;
  bool benzinli;

  Model({this.arabaModel, this.fiyati, this.benzinli});

  Model.fromJson(Map<String, dynamic> json) {
    arabaModel = json['araba_model'];
    fiyati = json['fiyati'];
    benzinli = json['benzinli'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['araba_model'] = this.arabaModel;
    data['fiyati'] = this.fiyati;
    data['benzinli'] = this.benzinli;
    return data;
  }
}