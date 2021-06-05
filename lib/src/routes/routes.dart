import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movilaj/src/views/inicio_view.dart';

final viewRoutes = <_Route>[
  /*_Route(FontAwesomeIcons.home, "Inicio", InicioView()),
  _Route(FontAwesomeIcons.dice, "Juegos de Azar", JuegosAzarView()),
  _Route(FontAwesomeIcons.moneyBill, "Juegos de Lotería", JuegosLoteriaView()),
  _Route(FontAwesomeIcons.gift, "Promociones Empresariales", ListaPeView()),
  _Route(FontAwesomeIcons.infoCircle, "Nosotros", NosotrosView()),
  _Route(FontAwesomeIcons.mapMarked, "Contáctanos", MapasView()),
  _Route(FontAwesomeIcons.layerGroup, "Normativas", NormativaView()),
  _Route(FontAwesomeIcons.questionCircle, "Consultas y Reclamos",
      ConsultasReclamosView()),
  _Route(FontAwesomeIcons.handHoldingUsd, "Denuncias Anticorrupción",
      DenunciasAnticorrupcionView()),
  _Route(FontAwesomeIcons.search, "Seguimiento de Casos", BuscaCasosView()),
  _Route(FontAwesomeIcons.search, "Seguimiento de Trámites",SeguimientoTramitesView()),
  _Route(FontAwesomeIcons.info, "Acerca de la App", AcercaAppView())*/
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget view;

  _Route(this.icon, this.titulo, this.view);
}
