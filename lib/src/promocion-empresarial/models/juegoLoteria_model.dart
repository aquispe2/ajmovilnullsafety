// To parse this JSON data, do
//
//     final juegosLoteriaModel = juegosLoteriaModelFromJson(jsonString);

import 'dart:convert';

JuegosLoteriaModel juegosLoteriaModelFromJson(String str) =>
    JuegosLoteriaModel.fromJson(json.decode(str));

String juegosLoteriaModelToJson(JuegosLoteriaModel data) =>
    json.encode(data.toJson());

class JuegosLoteriaModel {
  JuegosLoteriaModel({
    this.sorteoLoteriaId = 0,
    this.usuarioId = 0,
    this.citeResolucionId = 0,
    this.departamentoId = 0,
    this.nombreSorteo = "",
    this.citeResolucion = "",
    this.fechaSorteo,
    this.fechaCiteResolucion,
    this.montoCantidadPremioMayor = 0,
    this.usuario = "",
    this.departamento = "",
    this.fechaRegistro,
    this.estadoId = 0,
  });

  int sorteoLoteriaId;
  int usuarioId;
  int citeResolucionId;
  int departamentoId;
  String nombreSorteo;
  String citeResolucion;
  DateTime? fechaSorteo;
  DateTime? fechaCiteResolucion;
  double montoCantidadPremioMayor;
  String usuario;
  String departamento;
  DateTime? fechaRegistro;
  int estadoId;

  factory JuegosLoteriaModel.fromJson(Map<String, dynamic> json) =>
      JuegosLoteriaModel(
        sorteoLoteriaId: json["SorteoLoteriaID"],
        usuarioId: json["UsuarioID"],
        citeResolucionId: json["CiteResolucionID"],
        departamentoId: json["DepartamentoID"],
        nombreSorteo: json["NombreSorteo"],
        citeResolucion: json["CiteResolucion"],
        fechaSorteo: DateTime.parse(json["FechaSorteo"]),
        fechaCiteResolucion: DateTime.parse(json["FechaCiteResolucion"]),
        montoCantidadPremioMayor: json["MontoCantidadPremioMayor"],
        usuario: json["Usuario"],
        departamento: json["Departamento"],
        fechaRegistro: DateTime.parse(json["FechaRegistro"]),
        estadoId: json["EstadoID"],
      );

  Map<String, dynamic> toJson() => {
        "SorteoLoteriaID": sorteoLoteriaId,
        "UsuarioID": usuarioId,
        "CiteResolucionID": citeResolucionId,
        "DepartamentoID": departamentoId,
        "NombreSorteo": nombreSorteo,
        "CiteResolucion": citeResolucion,
        "FechaSorteo": fechaSorteo!.toIso8601String(),
        "FechaCiteResolucion": fechaCiteResolucion!.toIso8601String(),
        "MontoCantidadPremioMayor": montoCantidadPremioMayor,
        "Usuario": usuario,
        "Departamento": departamento,
        "FechaRegistro": fechaRegistro!.toIso8601String(),
        "EstadoID": estadoId,
      };
}
