part of 'pages.dart';

class DetailChatPage extends StatefulWidget {
  Product product;
  DetailChatPage(this.product, {Key? key}) : super(key: key);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget chatInput() {
      return Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.product is UninitializedProduct
                  ? SizedBox()
                  : productPreview(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: backgroundColor4,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: TextFormField(
                          controller: messageController,
                          style: primaryTextStyle,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Type Message ....',
                            hintStyle: subtitleTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      MessageServices().addMessage(
                          user: authProvider.user,
                          isFromUser: true,
                          message: messageController.text,
                          product: widget.product);

                      print(messageController.text);

                      setState(() {
                        widget.product = UninitializedProduct();
                        messageController.text = '';
                      });
                    },
                    child: Image.asset(
                      'assets/button_send.png',
                      width: 45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin),
        child: StreamBuilder<List<Message>>(
            stream: MessageServices()
                .getMessagesByUserId(userId: authProvider.user.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.hasData);
                return ListView(
                  children: snapshot.data!
                      .map((Message e) => ChatBuble(
                            isSender: e.isFromUser,
                            text: e.message,
                            product: e.product,
                          ))
                      .toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  PreferredSizeWidget header() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor1,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
            SizedBox(width: 25),
            Image.asset(
              'assets/image_shop_logo_online.png',
              height: 50,
              width: 50,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoes Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
                Text(
                  'Online',
                  style: subtitleTextStyle.copyWith(
                      fontSize: 14, fontWeight: light),
                ),
              ],
            ),
          ],
        ),
        // actions: [],
      ),
    );
  }

  Widget productPreview() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      width: 225,
      height: 74,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.product.galleries[0].url,
              width: 54,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product.name,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'en_US',
                          symbol: "\$",
                          name: '\$',
                          customPattern: '\$ #,##0.00')
                      .format(widget.product.price),
                  style:
                      priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.product = UninitializedProduct();
              });
            },
            child: Image.asset(
              'assets/button_close.png',
              width: 22,
            ),
          ),
        ],
      ),
    );
  }
}
