import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';

handlingData(response) {
  if (response is Statusrequest) {
    return response;
    // if (response == Statusrequest.offlineFailure) {
    //   return Statusrequest.offlineFailure;
    // } else {
    //   return Statusrequest.serveurFailure;
    // }
  } else {
    return Statusrequest.sucess;
  }
}
