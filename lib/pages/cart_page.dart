part of 'pages.dart';

class CartPage extends StatefulWidget {
  // final Cart cart;
  // const CartPage(this.cart);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget emptyCart() {
      return CustomPage(
        appBarText: 'Your Cart',
        buttonTap1: () {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        buttonTitle1: 'Explore Now',
        image: 'assets/icon_empty_cart.png',
        subtitle: "Let's find your favorite shoes",
        title: 'Opps! Your Cart is Empty',
      );
    }

    Widget bottomNavbar() {
      return Container(
        height: 190,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    defaultMargin, 0, defaultMargin, defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: primaryTextStyle.copyWith(fontSize: 14),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'en_US',
                              symbol: "\$",
                              name: '\$',
                              customPattern: '\$ #,##0.00')
                          .format(cartProvider.totalPrice()),
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Color(0xFF2B2938),
            ),
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(defaultMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout-detail');
                  },
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Continue to Checkout',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return (cartProvider.carts.length == 0)
        ? Scaffold(body: emptyCart())
        : Scaffold(
            backgroundColor: backgroundColor3,
            bottomNavigationBar: bottomNavbar(),
            body: SafeArea(
              child: ListView(
                children: [
                  Header(
                    title: 'Your Cart',
                    leading: true,
                  ),
                  Column(
                    children:
                        cartProvider.carts.map((e) => CartCard(e)).toList(),
                  )
                ],
              ),
            ),
          );
  }
}
