part of 'pages.dart';

class DetailProductPage extends StatefulWidget {
  final Product product;
  const DetailProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  List<String> image = [
    'assets/image_shoes.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
    'assets/image_shoes7.png',
    'assets/image_shoes8.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget body() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        widget.product.category.name,
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                  // favorite icon
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        wishlistProvider.setProduct(widget.product);
                        if (wishlistProvider.isWishlist(widget.product)) {
                          var snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Has been added to the Wishlist',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle,
                            ),
                            backgroundColor: secondaryColor,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          var snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Has been removed to the Wishlist',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle,
                            ),
                            backgroundColor: alertColor,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    },
                    child: Container(
                      width: 46,
                      height: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: wishlistProvider.isWishlist(widget.product)
                            ? secondaryColor
                            : Color(0xFF423F53),
                      ),
                      child: Image.asset(
                        'assets/icon_wishlist.png',
                        color: wishlistProvider.isWishlist(widget.product)
                            ? primaryTextColor
                            : backgroundColor1,
                        scale: 4,
                      ),
                    ),
                  ),
                ],
              ),
              // Price
              Container(
                width: double.infinity,
                color: backgroundColor2,
                height: 50,
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(top: defaultMargin, bottom: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price starts from',
                      style: primaryTextStyle.copyWith(fontSize: 14),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'en_US',
                              symbol: "\$",
                              name: '\$',
                              customPattern: '\$ #,##0.00')
                          .format(widget.product.price),
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
              // Description
              Text(
                'Description',
                style:
                    primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
              SizedBox(height: 12),
              Text(
                widget.product.description,
                style: secondaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: light),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: defaultMargin),
              // Familiar Shoes
              Text(
                'Familiar Shoes',
                style:
                    primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: image
                      .map(
                        (e) => Container(
                          width: 54,
                          height: 54,
                          margin: EdgeInsets.only(
                              right: (image[image.length - 1] == e) ? 0 : 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(image: AssetImage(e))),
                        ),
                      )
                      .toList(),
                ),
              ),
              // BottomIcon
              SizedBox(height: defaultMargin),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailChatPage(widget.product)));
                    },
                    child: Image.asset(
                      'assets/button_chat.png',
                      width: 54,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        cartProvider.addCart(widget.product);
                        showSuccessDialog();
                      },
                      child: Container(
                        height: 54,
                        width: 210,
                        alignment: Alignment.center,
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundShoes,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                iconHeader(),
                imageSlider(),
                indicator(),
                body(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        child: AlertDialog(
          backgroundColor: backgroundColor3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: primaryTextColor,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icon_success.png',
                  width: 100,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Hurray :)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Item added successfully',
                  style: secondaryTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/cart');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'View My Cart',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconHeader() {
    return Container(
      margin:
          EdgeInsets.fromLTRB(defaultMargin - 10, 10, defaultMargin - 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: backgroundColor1,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              color: backgroundColor1,
              size: 21,
            ),
          )
        ],
      ),
    );
  }

  Widget imageSlider() {
    return CarouselSlider(
      items: widget.product.galleries
          .map((e) => Image.network(
                e.url,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ))
          .toList(),
      options: CarouselOptions(
          initialPage: 0,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }

  Widget indicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.product.galleries
            .map(
              (e) => Container(
                margin: EdgeInsets.only(right: 4, top: 20),
                width: (widget.product.galleries.indexOf(e) == currentIndex)
                    ? 16
                    : 4,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (widget.product.galleries.indexOf(e) == currentIndex)
                      ? primaryColor
                      : Color(0xFFC4C4C4),
                ),
              ),
            )
            .toList());
  }
}
