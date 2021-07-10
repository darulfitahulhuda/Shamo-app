part of 'widgets.dart';

class ChatBuble extends StatelessWidget {
  final String text;
  final bool isSender;
  final Product? product;
  const ChatBuble(
      {Key? key, this.text = '', this.isSender = false, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          product is UninitializedProduct ? SizedBox() : productPreview(),
          Row(
            mainAxisAlignment: isSender == false
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        isSender == false ? backgroundColor5 : backgroundColor4,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender == false ? 12 : 0),
                      topRight: Radius.circular(isSender == true ? 12 : 0),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }

  Widget productPreview() {
    return Container(
      // margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      width: 230,
      // height: 74,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: backgroundColor5,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product!.galleries[0].url,
                  width: 70,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product!.name,
                      overflow: TextOverflow.fade,
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
                          .format(product!.price),
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 4),
                  width: 100,
                  height: 41,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor)),
                  child: Text(
                    'Add to Cart',
                    style: primaryTextStyle.copyWith(
                        color: primaryColor, fontSize: 14, fontWeight: regular),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 4),
                  width: 100,
                  height: 41,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor)),
                  child: Text(
                    'Buy Now',
                    style: primaryTextStyle.copyWith(
                        color: Color(0xFF2B2844),
                        fontSize: 14,
                        fontWeight: semiBold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
