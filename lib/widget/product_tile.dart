part of 'widgets.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: primaryTextColor,
              image: DecorationImage(
                image: NetworkImage(
                  product.galleries[0].url,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
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
                  overflow: TextOverflow.fade,
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(height: 6),
                Text(
                  NumberFormat.currency(
                          locale: 'en_US',
                          symbol: "\$",
                          name: '\$',
                          customPattern: '\$ #,##0.00')
                      .format(product.price),
                  style:
                      priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
