import 'package:play_hq/models/create_sale_model.dart';

abstract class CreateSaleRepository{

  Future<void> createSale(CreateSalePayload body);

}