part of 'widgets.dart';

class WishlistCard extends StatelessWidget {
  final Product product;

  const WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      height: 84,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12, 12, 20, 14),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries[0].url,
              height: 60,
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(
                      fontSize: 15, fontWeight: regular),
                ),
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
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Container(
              height: 36,
              width: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
              ),
              child: Image.asset(
                'assets/icon_wishlist.png',
                color: primaryTextColor,
                width: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
