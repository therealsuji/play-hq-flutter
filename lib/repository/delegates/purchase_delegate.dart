

import 'dart:async';
import 'dart:io';

import 'package:play_hq/models/orders_model/order_details.dart';
import 'package:play_hq/repository/clients/purchase_repository.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../models/orders_model/purchase_request.dart';
import '../../service_locator.dart';
import '../../services/base_managers/error.dart';

class PurchaseDelegate extends PurchasesRepository{

  final _networkCalls = Network.shared;

  @override
  Future<void> createPurchaseRequest(Map<String, dynamic> body) async {
    try{
      await _networkCalls.performRequest(APIConfig.orders, HttpAction.POST, body: body);
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
    }
    catch(e){
      print('error ' + e.toString());
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
    }
  }

}