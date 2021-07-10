part of 'home.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   ProductProvider().getProducts().whenComplete(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;
    ProductProvider productServices = Provider.of<ProductProvider>(context);

    @override
    Widget header(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ${user.name}',
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 24),
              ),
              Text(
                '@${user.username}',
                style: secondaryTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          Container(
            height: 54,
            width: 54,
            margin: EdgeInsets.only(right: defaultMargin),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.profilePhotoUrl!),
                  fit: BoxFit.cover,
                )),
          ),
        ],
      );
    }

    Widget popular(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Products',
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: productServices.product
                    .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        DetailProductPage(product: e)));
                          },
                          child: PopularProducts(e),
                        ))
                    .toList()),
          ),
          SizedBox(height: defaultMargin),
        ],
      );
    }

    Widget newArrivals() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Arrivals',
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: productServices.product
                .map((e) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailProductPage(product: e)));
                      },
                      child: ProductTile(e),
                    ))
                .toList(),
          ),
          SizedBox(height: defaultMargin),
        ],
      );
    }

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: ListView(
          children: [
            header(context),
            categories(),
            popular(context),
            newArrivals(),
          ],
        ),
      ),
    );
  }

  Widget categories() {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin, bottom: defaultMargin),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            customCategories(name: 'All Shoes', onTap: true),
            customCategories(name: 'Running', onTap: false),
            customCategories(name: 'Training', onTap: false),
            customCategories(name: 'Basketball', onTap: false),
            customCategories(name: 'Hiking', onTap: false),
          ],
        ),
      ),
    );
  }

  Widget customCategories({required String name, bool onTap = false}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 83,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (onTap == true) ? primaryColor : backgroundColor2,
          border: (onTap == true) ? null : Border.all(color: subtitleTextColor),
        ),
        child: Text(
          name,
          style: (onTap == true)
              ? primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium)
              : subtitleTextStyle.copyWith(fontSize: 13, fontWeight: light),
        ),
      ),
    );
  }
}
