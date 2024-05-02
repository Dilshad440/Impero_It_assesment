import 'package:impero_it_assesment/core/base/base_bloc.dart';
import 'package:impero_it_assesment/src/features/products/models/requests/get_product_req.dart';
import 'package:impero_it_assesment/src/features/products/models/response/product_response.dart';
import 'package:impero_it_assesment/src/features/products/states/product_states.dart';
import 'package:impero_it_assesment/src/repository/api_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc extends BaseBloc {
  final productState = BehaviorSubject<ProductState>();
  final _repo = AppRepository();
  final isLoadMore = BehaviorSubject<bool>.seeded(false);

  int pageIndex = 1;

  void getProducts() {
    final req = GetProductReq(
      categoryId: 0,
      deviceManufacturer: "Google",
      deviceModel: "Android SDK built for x86",
      deviceToken: " ",
      pageIndex: pageIndex,
    ).toJson();
    subscriptions.add(_repo
        .getProductRes(req)
        .map((event) => ProductState.completed(event))
        .startWith(ProductState.loading())
        .onErrorReturnWith((error, stackTrace) => ProductState.error(error))
        .listen((event) {
      productState.add(event);
    }));
  }

  void getMoreProducts() {
    isLoadMore.add(true);
    pageIndex++;
    final req = {
      "CategoryId": 56,
      "PageIndex": pageIndex,
    };
    subscriptions.add(_repo.getProductRes(req).listen((event) {
      final oldData = productState.valueOrNull?.data?.result?.category;
      final newData = event.result?.category ?? [];
      oldData?.addAll(newData);
      isLoadMore.add(false);
      productState.add(ProductState.completed(ProductResponse(result: Result(category: oldData))));
    }, onError: (e) {
      isLoadMore.add(false);
    }));
  }

  @override
  void dispose() {
    productState.close();
    super.dispose();
  }
}
