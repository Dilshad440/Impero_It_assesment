import 'package:impero_it_assesment/core/api_config/api_const.dart';

import '../../core/api_config/rest_client.dart';
import '../features/products/models/response/product_response.dart';

class RemoteSource {
  final _client = RestClient.getInstance();

  Stream<ProductResponse> getProducts(Map<String, dynamic> req) {
    return Stream.fromFuture(_client.dio.post(ApiConst.productListing, data: req)).map(
      (event) => ProductResponse.fromJson(event.data),
    );
  }
}
