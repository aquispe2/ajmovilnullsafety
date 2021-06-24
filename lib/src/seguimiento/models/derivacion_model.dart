import 'package:flutter/foundation.dart';

@immutable
class DerivacionModel {
  const DerivacionModel({
    required this.area,
    required this.fechaAsignacion,
  });

  final String area;
  final String fechaAsignacion;

  factory DerivacionModel.fromJson(Map<String, dynamic> json) =>
      DerivacionModel(
          area: json['area'] as String,
          fechaAsignacion: json['fechaAsignacion'] as String);

  Map<String, dynamic> toJson() =>
      {'area': area, 'fechaAsignacion': fechaAsignacion};

  DerivacionModel clone() =>
      DerivacionModel(area: area, fechaAsignacion: fechaAsignacion);

  DerivacionModel copyWith({String? area, String? fechaAsignacion}) =>
      DerivacionModel(
        area: area ?? this.area,
        fechaAsignacion: fechaAsignacion ?? this.fechaAsignacion,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DerivacionModel &&
          area == other.area &&
          fechaAsignacion == other.fechaAsignacion;

  @override
  int get hashCode => area.hashCode ^ fechaAsignacion.hashCode;
}
