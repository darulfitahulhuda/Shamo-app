part of 'widgets.dart';

class CartCard extends StatelessWidget {
  final Cart cart;

  const CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: backgroundColor4,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(cart.product.galleries[0].url),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartProvider.removeCart(cart.id);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon_remove.png',
                            width: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Remove',
                            style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light,
                                color: Color(0xFFED6363ED6363)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        cart.product.name,
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
                            .format(cart.product.price * cart.quantity),
                        style: priceTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartProvider.addQuantity(cart.id);
                      },
                      child: Image.asset(
                        'assets/button_add.png',
                        width: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      cart.quantity.toString(),
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {
                        cartProvider.reduceQuantity(cart.id);
                      },
                      child: Image.asset(
                        'assets/button_min.png',
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
