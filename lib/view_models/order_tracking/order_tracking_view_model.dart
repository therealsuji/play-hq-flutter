import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_enums.dart';

abstract class OrderTrackingViewModel with ChangeNotifier{

  void changeOrderStatus(String id, UserType userType , OrderStatus status);
}