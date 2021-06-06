// To parse this JSON data, do
//
//     final oficinaModel = oficinaModelFromJson(jsonString);

import 'dart:convert';

List<OficinaModel> oficinaModelFromJson(String str) => List<OficinaModel>.from(
    json.decode(str).map((x) => OficinaModel.fromJson(x)));

String oficinaModelToJson(List<OficinaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OficinaModel {
  OficinaModel({
    this.oficinaId = 0,
    this.nombreOficina = "",
    this.estadoId = 0,
  });

  int oficinaId;
  String nombreOficina;
  int estadoId;

  factory OficinaModel.fromJson(Map<String, dynamic> json) => OficinaModel(
        oficinaId: json["oficinaID"],
        nombreOficina: json["nombreOficina"],
        estadoId: json["estadoID"],
      );

  Map<String, dynamic> toJson() => {
        "oficinaID": oficinaId,
        "nombreOficina": nombreOficina,
        "estadoID": estadoId,
      };

  factory OficinaModel.parse(OficinaModel objOficina) => OficinaModel(
        oficinaId: objOficina.oficinaId >= 0 ? objOficina.oficinaId : 0,
        nombreOficina:
            objOficina.nombreOficina != "" ? objOficina.nombreOficina : "",
        estadoId: objOficina.estadoId > 0 ? objOficina.estadoId : 0,
      );
}
