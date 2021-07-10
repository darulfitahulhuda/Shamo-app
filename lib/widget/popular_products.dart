part of 'widgets.dart';

class PopularProducts extends StatelessWidget {
  final Product product;

  PopularProducts(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 278,
      margin: EdgeInsets.only(right: defaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundShoes,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              product.galleries[0].url,
              height: 150,
              width: 215,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              bottom: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category.name,
                  style: secondaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                ),
                SizedBox(height: 6),
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                SizedBox(height: 6),
                Text(
                    NumberFormat.simpleCurrency(
                      locale: 'en_US',
                      name: '\$ ',
                    ).format(product.price),
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium)),
                // Text(
                //   NumberFormat.currency(
                //     locale: 'en_US',
                //     symbol: "\$",
                //     name: '\$',
                //     // decimalDigits: ,
                //     customPattern: '\$ #,##0.00',
                //   ).format(product.price),
                //   style:
                //       priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
