// To parse this JSON data, do
//
//     final juegosAzarModel = juegosAzarModelFromJson(jsonString);

import 'dart:convert';

JuegosAzarModel juegosAzarModelFromJson(String str) =>
    JuegosAzarModel.fromJson(json.decode(str));

String juegosAzarModelToJson(JuegosAzarModel data) =>
    json.encode(data.toJson());

class JuegosAzarModel {
  JuegosAzarModel({
    this.sigla = "",
    this.nombreSalonJuego = "",
    this.nombreOperador = "",
    this.cantidadMesas = 0,
    this.horarioAtencion = "",
    this.juegosAutorizados,
    this.lstDirecciones,
  });

  String sigla;
  String nombreSalonJuego;
  String nombreOperador;
  int cantidadMesas;
  String horarioAtencion;
  List<String>? juegosAutorizados;
  List<LstDireccione>? lstDirecciones;

  factory JuegosAzarModel.fromJson(Map<String, dynamic> json) =>
      JuegosAzarModel(
        sigla: json["Sigla"],
        nombreSalonJuego: json["NombreSalonJuego"],
        nombreOperador: json["NombreOperador"],
        cantidadMesas: json["CantidadMesas"],
        horarioAtencion: json["HorarioAtencion"],
        juegosAutorizados:
            List<String>.from(json["JuegosAutorizados"].map((x) => x)),
        lstDirecciones: List<LstDireccione>.from(
            json["lstDirecciones"].map((x) => LstDireccione.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Sigla": sigla,
        "NombreSalonJuego": nombreSalonJuego,
        "NombreOperador": nombreOperador,
        "CantidadMesas": cantidadMesas,
        "HorarioAtencion": horarioAtencion,
        "JuegosAutorizados":
            List<dynamic>.from(juegosAutorizados!.map((x) => x)),
        "lstDirecciones":
            List<dynamic>.from(lstDirecciones!.map((x) => x.toJson())),
      };
}

class LstDireccione {
  LstDireccione({
    this.regional = "",
    this.direccion = "",
  });

  String regional;
  String direccion;

  factory LstDireccione.fromJson(Map<String, dynamic> json) => LstDireccione(
        regional: json["Regional"],
        direccion: json["Direccion"],
      );

  Map<String, dynamic> toJson() => {
        "Regional": regional,
        "Direccion": direccion,
      };
}
