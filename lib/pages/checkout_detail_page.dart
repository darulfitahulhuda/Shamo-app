part of 'pages.dart';

class CheckoutDetailPage extends StatefulWidget {
  const CheckoutDetailPage({Key? key}) : super(key: key);

  @override
  _CheckoutDetailPageState createState() => _CheckoutDetailPageState();
}

class _CheckoutDetailPageState extends State<CheckoutDetailPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    Widget listItem() {
      return Container(
        margin: EdgeInsets.fromLTRB(
            defaultMargin, defaultMargin, defaultMargin, defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List Item',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            Column(
              children: cartProvider.carts.map((e) => CheckoutCard(e)).toList(),
            ),
          ],
        ),
      );
    }

    Widget address() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address Details',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icon_line.png',
                      height: 30,
                    ),
                    Image.asset(
                      'assets/icon_your_address.png',
                      width: 40,
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Store Location',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      Text(
                        'Addidas Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                      SizedBox(height: defaultMargin),
                      Text(
                        'Your Address',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      Text(
                        'Marsemoon',
                        overflow: TextOverflow.ellipsis,
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget payment() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Quantity',
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  '${cartProvider.totalItems()} Items',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Price',
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'en_US',
                          symbol: "\$",
                          name: '\$',
                          customPattern: '\$ #,##0.00')
                      .format(cartProvider.totalPrice()),
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping',
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  'Free',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              height: 1,
              // color: Color(0xFF2E3141),
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: priceTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'en_US',
                          symbol: "\$",
                          name: '\$',
                          customPattern: '\$ #,##0.00')
                      .format(cartProvider.totalPrice()),
                  style: priceTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget checkout(BuildContext context) {
      return Container(
        height: 110,
        child: Column(
          children: [
            Divider(
              height: 1,
              color: Color(0xFF2B2938),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin - 10, defaultMargin, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (await transactionProvider.checkout(
                    authProvider.user.token!,
                    cartProvider.carts,
                    cartProvider.totalPrice(),
                  )) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/checkout-success', (route) => false);
                  } else {}

                  setState(() {
                    isLoading = false;
                  });
                },
                child: isLoading
                    ? LoadingButton()
                    : Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Checkout Now',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      bottomNavigationBar: checkout(context),
      body: ListView(
        children: [
          Header(title: 'Checkout Details', leading: true),
          listItem(),
          address(),
          payment(),
        ],
      ),
    );
  }
}
