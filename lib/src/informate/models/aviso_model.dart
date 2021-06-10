import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AvisoModel {
  const AvisoModel({
    this.avisoMovilId = 0,
    this.fechaAviso = "",
    this.enlace = "",
    this.nombreArchivo = "",
    this.titulo = "",
    this.contenido = "",
  });

  final int avisoMovilId;
  final String fechaAviso;
  final String enlace;
  final String nombreArchivo;
  final String titulo;
  final String contenido;

  factory AvisoModel.fromJson(Map<String, dynamic> json) => AvisoModel(
      avisoMovilId: json['avisoMovilId'] as int,
      fechaAviso: json['fechaAviso'] as String,
      enlace: json['enlace'] as String,
      nombreArchivo: json['nombreArchivo'] as String,
      titulo: json['titulo'] as String,
      contenido: json['contenido'] as String);

  Map<String, dynamic> toJson() => {
        'avisoMovilId': avisoMovilId,
        'fechaAviso': fechaAviso,
        'enlace': enlace,
        'nombreArchivo': nombreArchivo,
        'titulo': titulo,
        'contenido': contenido
      };

  AvisoModel clone() => AvisoModel(
      avisoMovilId: avisoMovilId,
      fechaAviso: fechaAviso,
      enlace: enlace,
      nombreArchivo: nombreArchivo,
      titulo: titulo,
      contenido: contenido);

  AvisoModel copyWith(
          {int? avisoMovilId,
          String? fechaAviso,
          String? enlace,
          String? nombreArchivo,
          String? titulo,
          String? contenido}) =>
      AvisoModel(
        avisoMovilId: avisoMovilId ?? this.avisoMovilId,
        fechaAviso: fechaAviso ?? this.fechaAviso,
        enlace: enlace ?? this.enlace,
        nombreArchivo: nombreArchivo ?? this.nombreArchivo,
        titulo: titulo ?? this.titulo,
        contenido: contenido ?? this.contenido,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvisoModel &&
          avisoMovilId == other.avisoMovilId &&
          fechaAviso == other.fechaAviso &&
          enlace == other.enlace &&
          nombreArchivo == other.nombreArchivo &&
          titulo == other.titulo &&
          contenido == other.contenido;

  @override
  int get hashCode =>
      avisoMovilId.hashCode ^
      fechaAviso.hashCode ^
      enlace.hashCode ^
      nombreArchivo.hashCode ^
      titulo.hashCode ^
      contenido.hashCode;
}
