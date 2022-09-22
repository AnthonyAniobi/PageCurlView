import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:ntisa_burgers/model/error_model.dart';
import 'package:ntisa_burgers/screens/homepage/widget/top_product_card.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';

class TopProductsList extends StatefulWidget {
  const TopProductsList({
    Key? key,
  }) : super(key: key);

  @override
  State<TopProductsList> createState() => _TopProductsListState();
}

class _TopProductsListState extends State<TopProductsList> {
  Future<Either<ErrorModel, List<ProductModel>>> _getProducts(
      BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/data.json");
    List jsonResult = jsonDecode(data);
    return Right(jsonResult.map((e) => ProductModel.fromMap(e)).toList());
  }

  Widget _loadError(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppFont.mediumBold(message),
        MaterialButton(
            child: const Text('Reload'),
            onPressed: () {
              setState(() {});
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getProducts(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.orange),
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return _loadError('No data!');
          } else if (snapshot.hasData) {
            if (snapshot.data!.isLeft) {
              _loadError(snapshot.data!.left.getMessage());
            } else {
              List<ProductModel> _data = snapshot.data!.right;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    if (_data[index].imageUrl.isEmpty) {
                      return Container(); // do nothing if no image is found
                    }
                    return TopProductCard(product: _data[index]);
                  });
            }
          }
          return _loadError('An error occured');
        });
  }
}
