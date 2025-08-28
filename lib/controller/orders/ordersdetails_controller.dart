import 'dart:async';

import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_admin_app_php/data/datasource/remote/orders/ordersdetails_data.dart';
import 'package:ecommerce_admin_app_php/data/model/orders_model.dart';
import 'package:ecommerce_admin_app_php/data/model/ordersdetails_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersdetailsController extends GetxController {
  late OrdersModel ordersModel;

  Statusrequest statusrequest = Statusrequest.loading;
  Completer<GoogleMapController>? completerController;
  Position? position;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];

  List<OrdersDetailsModel> data = [];
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  double? lat;
  double? long;
  addMarkers(LatLng latlng) {
    //pour que a chaque clic il efface the marker precedent
    markers.clear();
    //add marker in the map
    markers.add(Marker(markerId: MarkerId("1"), position: latlng));
    lat = latlng.latitude;
    long = latlng.longitude;
    update();
  }

  userPositionData() {
    if (ordersModel.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 12.455,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
    } else {
      cameraPosition = CameraPosition(
        target: LatLng(39.54, 35.59),
        zoom: 12.455,
      );
    }
  }

  getOrdersDetailsData() async {
    statusrequest = Statusrequest.loading;
    var response = await ordersDetailsData
        .getOrdersDetailsData("${ordersModel.ordersId!}");
    print("---------------------response: $response");
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    getOrdersDetailsData();
    userPositionData();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
