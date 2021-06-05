// To parse this JSON data, do
//
//     final normativaModel = normativaModelFromJson(jsonString);

import 'dart:convert';

NormativaModel normativaModelFromJson(String str) =>
    NormativaModel.fromJson(json.decode(str));

String normativaModelToJson(NormativaModel data) => json.encode(data.toJson());

class NormativaModel {
  NormativaModel({this.normativa = "", this.lstNormativa});

  String normativa;
  List<LstNormativa>? lstNormativa;

  factory NormativaModel.fromJson(Map<String, dynamic> json) => NormativaModel(
        normativa: json["Normativa"],
        lstNormativa: List<LstNormativa>.from(
            json["lstNormativa"].map((x) => LstNormativa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Normativa": normativa,
        "lstNormativa":
            List<dynamic>.from(lstNormativa!.map((x) => x.toJson())),
      };

  factory NormativaModel.parse(NormativaModel? objNormativa) => NormativaModel(
        normativa: objNormativa != null ? objNormativa.normativa : "",
        lstNormativa: objNormativa != null
            ? objNormativa.lstNormativa
            : List<LstNormativa>.empty(),
      );
}

class LstNormativa {
  LstNormativa({
    this.nombre = "",
    this.descripcion = "",
    this.fechaEmision = DateTime.april,
    this.urlArchivo = "",
    this.gestion = 0,
  });

  String nombre;
  String descripcion;
  var fechaEmision;
  String urlArchivo;
  int gestion;

  factory LstNormativa.fromJson(Map<String, dynamic> json) => LstNormativa(
        nombre: json["Nombre"],
        descripcion: json["Descripcion"],
        fechaEmision: DateTime.parse(json["FechaEmision"]),
        urlArchivo: json["UrlArchivo"],
        gestion: json["Gestion"],
      );

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Descripcion": descripcion,
        "FechaEmision": fechaEmision.toIso8601String(),
        "UrlArchivo": urlArchivo,
        "Gestion": gestion,
      };
}
