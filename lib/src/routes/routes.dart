import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movilaj/src/informate/views/acercaApp_view.dart';
import 'package:movilaj/src/informate/views/mapas_view.dart';
import 'package:movilaj/src/informate/views/normativa_view.dart';
import 'package:movilaj/src/informate/views/nosotros_view.dart';
import 'package:movilaj/src/promocion-empresarial/views/ListaPe_view.dart';
import 'package:movilaj/src/promocion-empresarial/views/juegosAzar_view.dart';
import 'package:movilaj/src/promocion-empresarial/views/juegosLoteria_view.dart';
import 'package:movilaj/src/seguimiento/views/buscaCasos_view.dart';
import 'package:movilaj/src/seguimiento/views/seguimientoTramites_view.dart';
import 'package:movilaj/src/views/inicio_view.dart';

final viewRoutes = <_Route>[
  _Route(null, "Inicio", InicioView()),
  _Route(null, "Juegos de Azar", JuegosAzarView()),
  _Route(null, "Juegos de Lotería", JuegosLoteriaView()),
  _Route(null, "Promociones Empresariales", ListaPeView()),
  _Route(null, "Nosotros", NosotrosView()),
  _Route(null, "Contáctanos", MapasView()),
  _Route(null, "Normativas", NormativaView()),
  //_Route(null, "Consultas y Reclamos",ConsultasReclamosView()),
  //_Route(null, "Denuncias Anticorrupción",DenunciasAnticorrupcionView()),
  _Route(null, "Seguimiento de Casos", BuscaCasosView()),
  _Route(null, "Seguimiento de Trámites", SeguimientoTramitesView()),
  _Route(null, "Acerca de la App", AcercaAppView())
];

class _Route {
  final IconData? icon;
  final String titulo;
  final Widget view;

  _Route(this.icon, this.titulo, this.view);
}
