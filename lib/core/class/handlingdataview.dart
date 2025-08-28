import 'package:ecommerce_admin_app_php/core/class/statusrequest.dart';
import 'package:ecommerce_admin_app_php/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const Handlingdataview({
    super.key,
    required this.statusrequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250),
          )
        : statusrequest == Statusrequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 250, height: 250),
              )
            : statusrequest == Statusrequest.serveurFailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 250, height: 250),
                  )
                : statusrequest == Statusrequest.failure
                    ? Center(
                        child: Lottie.asset(
                          AppImageAsset.noData,
                          width: 250,
                          height: 250,
                          repeat: false,
                        ),
                      )
                    : widget;
  }
}

class HandlingdataviewRequest extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlingdataviewRequest({
    super.key,
    required this.statusrequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250),
          )
        : statusrequest == Statusrequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 250, height: 250),
              )
            : statusrequest == Statusrequest.serveurFailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 250, height: 250),
                  )
                : widget;
  }
}
