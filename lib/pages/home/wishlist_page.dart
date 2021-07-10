part of 'home.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    return (wishlistProvider.wishlist.isEmpty)
        ? CustomPage(
            appBarText: 'Your Cart',
            image: 'assets/image_wishlist.png',
            title: 'Opss! Your Cart is Empty',
            subtitle: "let's find your favorite shoes",
            buttonTitle1: 'Explore Store',
            buttonTap1: () {
              pageProvider.currentIndex = 0;
            })
        : Column(
            children: [
              Header(title: 'Favorite Shoes'),
              Expanded(
                child: Container(
                  color: backgroundColor3,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: ListView(
                      children: wishlistProvider.wishlist
                          .map((e) => WishlistCard(e))
                          .toList()),
                ),
              ),
            ],
          );
  }
}
