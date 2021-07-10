part of 'widgets.dart';

class CheckoutCard extends StatelessWidget {
  final Cart cart;

  const CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              cart.product.galleries[0].url,
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'en_US',
                          symbol: "\$",
                          name: '\$',
                          customPattern: '\$ #,##0.00')
                      .format(cart.product.price * cart.quantity),
                  style: priceTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
          ),
          SizedBox(width: 6),
          Text(
            '${cart.quantity} items',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
