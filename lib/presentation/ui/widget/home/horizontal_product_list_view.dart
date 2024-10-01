import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/widget/product_card.dart';
import 'package:flutter/cupertino.dart';

class HorizontalProductListView extends StatelessWidget {
   const HorizontalProductListView({
    super.key,required this.productList
  });
final List<ProductModel>productList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount:productList.length,
      itemBuilder: (context, index) {
        return  ProductCard(product: productList[index],);
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}