import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

//Set<Marker> myMarker = {};

class Mappage extends StatefulWidget {
  const Mappage({super.key});

  @override
  State<Mappage> createState() => _MappageState();
}

class _MappageState extends State<Mappage> {

  

  List<Marker> myMarker = [];

  Location locationController =  new Location();

  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  static const LatLng kothamangalam = LatLng(10.0603, 76.6352);

  LatLng? currentPosition = null;

   @override
   void initState() {
    super.initState();
    locationUpdates();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:currentPosition == null 
      ? const Center(child: Text("Loading...."),
      )
      : GoogleMap(
        onMapCreated:((GoogleMapController controller) =>
         mapController.complete(controller)),
        initialCameraPosition:const CameraPosition(
          target: kothamangalam,
          zoom: 13),

          mapType: MapType.hybrid,

            markers: {
            ...Set.from(myMarker),
            Marker(
              markerId:const MarkerId("currentPosition"),
              icon: BitmapDescriptor.defaultMarker,
              position: currentPosition!
              )
          },
 
          onTap: addMarker,
            
        ),
    );
  }

  addMarker(LatLng tappedPoint){
    setState(() {
      //myMarker = [];
      if(myMarker.length >= 3){
        myMarker.removeAt(0);
      }
      myMarker.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: true,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onDragEnd:(endPosition){
            print(endPosition);
          }
        )
      );
    });
  }

  Future<void> cameraPosition(LatLng pos) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition nnewCameraPosition = CameraPosition(target: pos,zoom: 13);

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(nnewCameraPosition),
    );
  }

  Future<void> locationUpdates() async{

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if(serviceEnabled){
      serviceEnabled = await locationController.requestService();
    }else{
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if(permissionGranted == PermissionStatus.denied){
      permissionGranted = await locationController.requestPermission();
      if(permissionGranted != PermissionStatus.granted){
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if(currentLocation.latitude != null && currentLocation.longitude != null){
        setState(() {
          currentPosition = LatLng(currentLocation.latitude!,currentLocation.longitude!);
          cameraPosition(currentPosition!);
        });
      }
    });
  }
}