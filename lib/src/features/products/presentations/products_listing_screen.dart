import 'package:flutter/material.dart';
import 'package:impero_it_assesment/core/base/common_loading_widget.dart';
import 'package:impero_it_assesment/core/components/common_appbbar.dart';
import 'package:impero_it_assesment/core/components/common_error_widget.dart';
import 'package:impero_it_assesment/core/components/data_not_found_widget.dart';
import 'package:impero_it_assesment/core/components/product_widget.dart';
import 'package:impero_it_assesment/core/constant/app_constant.dart';
import 'package:impero_it_assesment/core/theme/app_colors.dart';
import 'package:impero_it_assesment/core/theme/app_text_style.dart';
import 'package:impero_it_assesment/src/features/products/bloc/product_bloc.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  final scrollController = ScrollController();

  late ProductBloc productBloc;

  @override
  void initState() {
    productBloc = ProductBloc();
    productBloc.getProducts();
    super.initState();
    _fetchMore();
  }

  void _fetchMore() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > scrollController.position.maxScrollExtent - 200) {
        productBloc.getMoreProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConst.tabs.length,
      child: Scaffold(
        appBar: CommonAppBar(
          title: "Product Listing",
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.teal,
            tabs: AppConst.tabs
                .map(
                  (e) => Tab(
                    child: Text(
                      e,
                      style: AppTextStyle.display.small.white,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: AppConst.tabs
              .map(
                (e) => StreamBuilder(
                  stream: productBloc.productState,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    if (state?.isLoading ?? false) {
                      return const CommonLoadingWidget();
                    }
                    if (state?.isError ?? false) {
                      return const CommonErrorWidget();
                    }
                    final category = state?.data?.result?.category?.firstOrNull?.subCategories;
                    if (category == null) {
                      return const DataNotFound();
                    }
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            itemCount: category.length,
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              return ProductWidgets(category: category[index]);
                            },
                          ),
                        ),
                        StreamBuilder(
                          stream: productBloc.isLoadMore,
                          builder: (context, snapshot) {
                            if (snapshot.data == false) {
                              return const SizedBox.shrink();
                            }
                            return const CommonLoadingWidget();
                          },
                        )
                      ],
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
