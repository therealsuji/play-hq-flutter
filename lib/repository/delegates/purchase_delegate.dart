import 'dart:async';
import 'dart:io';

import '../../helpers/app_enums.dart';
import '../../helpers/networks/app_config.dart';
import '../../helpers/networks/app_network.dart';
import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error.dart';
import '../clients/purchase_repository.dart';

class PurchaseDelegate extends PurchasesRepository {
  final _networkCalls = Network.shared;

  @override
  Future<void> createPurchaseRequest(Map<String, dynamic> body) async {
    try {
      await _networkCalls.performRequest(APIConfig.orders, HttpAction.POST, body: body);
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }
}
