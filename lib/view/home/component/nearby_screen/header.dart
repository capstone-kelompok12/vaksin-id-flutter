import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/home/home_view_model.dart';

class HeaderGoogleMaps extends StatefulWidget {
  HeaderGoogleMaps({super.key, required this.markers, required this.customInfoWindowController, required this.selectedMarker, required this.markerIcon});

  final List<Marker> markers;
  final CustomInfoWindowController customInfoWindowController;
  final Uint8List? markerIcon;
  int selectedMarker;

  @override
  State<HeaderGoogleMaps> createState() => _HeaderGoogleMapsState();
}

class _HeaderGoogleMapsState extends State<HeaderGoogleMaps> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 209,
      child: Consumer<HomeViewModel>(
        builder: (context, value, _) =>
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            widget.markers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    mapType: MapType.normal,
                    markers: Set<Marker>.of(widget.markers),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    onCameraMove: (position) {
                      widget.customInfoWindowController.onCameraMove!();
                    },
                    onTap: (argument) {
                      widget.customInfoWindowController
                          .hideInfoWindow!();
                      if (widget.selectedMarker != -1) {
                        setState(() {
                          widget.markers[widget.selectedMarker] =
                            widget.markers[widget.selectedMarker].copyWith(
                              iconParam: BitmapDescriptor.fromBytes(widget.markerIcon!));
                          widget.selectedMarker = 0;
                        });
                      }
                    },
                    initialCameraPosition: CameraPosition(
                      target: value.currentLatLng ??
                          const LatLng(-6.200000, 106.816666),
                      zoom: 11.5,
                    ),
                    onMapCreated: (controller) {
                      widget.customInfoWindowController
                          .googleMapController = controller;
                      value.gmController = controller;
                    },
                  ),
            CustomInfoWindow(
              controller: widget.customInfoWindowController,
              height: 75,
              width: 150,
              offset: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue),
                    child: IconButton(
                        onPressed: () {
                          value.gmController?.animateCamera(
                              CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                      target: value.currentLatLng!,
                                      zoom: 11.5)));
                        },
                        icon: const Icon(
                          Icons.location_searching_sharp,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}