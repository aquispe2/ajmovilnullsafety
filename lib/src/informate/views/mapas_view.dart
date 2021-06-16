import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:flutter/material.dart';

import '../../views/menu_principal_view.dart';
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:movilaj/src/utils/colores.dart' as colores;

class MapasView extends StatefulWidget {
  @override
  _MapasViewState createState() => _MapasViewState();
}

class _MapasViewState extends State<MapasView> {
  LatLng locationLaPaz = LatLng(-16.529945, -68.101976);
  LatLng locationCochabamba = LatLng(-17.3929279, -66.1587738);
  LatLng locationSantaCruz = LatLng(-17.7716199, -63.1783707);
  int _selectedIndex = 0;

  String _titulo = "";
  String _texto = "";

  Map<MarkerId, Marker> _markers = Map();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    cargarMarker(
        locationLaPaz,
        "Oficina Nacional",
        "Calle 16 de Obrajes N° 220 Edif. Centro de Negocios Obrajes Piso 2 Telfs.: (+591)(2) 2125081 - (+591)(2) 2125057",
        "markerLaPaz");
    super.initState();
  }

  void cargarMarker(
      LatLng location, String pTitulo, String pTexto, String markerId) async {
    Marker resultMarker = Marker(
      markerId: MarkerId(markerId),
      position: location,
      //icon: BitmapDescriptor.fromBytes(bitmap),
    );
    _markers[MarkerId(markerId)] = resultMarker;

    _titulo = pTitulo;
    _texto = pTexto;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _clickAtras,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              variable.CONTACTANOS,
              style: estiloTexto.stlTituloBarBlanco,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colores.azul_claro_aj, colores.azul_oscuro_aj],
                ),
              ),
            )),
        drawer: MenuPrincipal(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: locationLaPaz, zoom: 15),
              compassEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set.of(_markers.values)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
                size: 15,
              ),
              title: Text(
                'La Paz',
                style: estiloTexto.stlTextoPequeno,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
                size: 15,
              ),
              title: Text(
                'Cochabamba',
                style: estiloTexto.stlTextoPequeno,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
                size: 15,
              ),
              title: Text(
                'Santa Cruz',
                style: estiloTexto.stlTextoPequeno,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: colores.blue_grey_darken_3,
          onTap: _onItemTapped,
        ),
        floatingActionButton: Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 30),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 80,
          child: Column(
            children: <Widget>[
              Text(
                _titulo,
                style: estiloTexto.stlSubTitulo,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _texto,
                style: estiloTexto.stlTextoPequeno,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    if (index == 0) {
      cargarMarker(
          locationLaPaz,
          "Oficina Nacional",
          "Calle 16 de Obrajes N° 220 Edif. Centro de Negocios Obrajes Piso 2 Telfs.: (+591)(2) 2125081 - (+591)(2) 2125057",
          "markerLaPaz");
      _gotoLocation(locationLaPaz.latitude, locationLaPaz.longitude);
    }

    if (index == 1) {
      cargarMarker(
          locationCochabamba,
          "Regional Cochabamba",
          "Avenida Ayacucho esquina Heroínas, Edificio ECOBOL Telfs. (+591)(4) 4661000 y (+591)(4) 4661001",
          "markerCocha");
      _gotoLocation(locationCochabamba.latitude, locationCochabamba.longitude);
    }

    if (index == 2) {
      cargarMarker(
          locationSantaCruz,
          "Regional Santa Cruz",
          "Calle Prolongación Campero #155 UV 1 Manzana 7 Zona Norte Telfs. (+591)(3) 3333031 y (+591)(3) 3323031",
          "markerSanta");
      _gotoLocation(locationSantaCruz.latitude, locationSantaCruz.longitude);
    }
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
     Future<bool> _clickAtras() {
    Get.toNamed("inicio");
    return new Future.value(true);
  }
}
