import 'package:impero_it_assesment/src/features/products/models/response/product_response.dart';

import '../../../../core/base/base_ui_state.dart';

class ProductState extends BaseUiState<ProductResponse> {
  ProductState.loading() : super.loading();

  ProductState.completed(ProductResponse data) : super.completed(data: data);

  ProductState.error(super.error) : super.error();
}
