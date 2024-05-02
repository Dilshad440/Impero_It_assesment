import 'package:impero_it_assesment/src/data_source/remote_data_source.dart';

import '../features/products/models/response/product_response.dart';

class AppRepository {
  final _remoteSource = RemoteSource();

  Stream<ProductResponse> getProductRes(Map<String, dynamic> req) {
    return _remoteSource.getProducts(req);
  }
}
