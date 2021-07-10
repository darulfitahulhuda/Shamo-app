part of 'widgets.dart';

class ChatTile extends StatelessWidget {
  final Message message;
  const ChatTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailChatPage(UninitializedProduct())));
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image_shop_logo.png',
                height: 54,
                width: 54,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoes Store',
                      style: primaryTextStyle.copyWith(
                          fontSize: 15, fontWeight: regular),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width -
                          (60 + 54 + 12 + 40),
                      child: Text(
                        message.message,
                        overflow: TextOverflow.ellipsis,
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Now',
                style: secondaryTextStyle.copyWith(
                    fontSize: 10, fontWeight: regular),
              )
            ],
          ),
          SizedBox(height: 12),
          Divider(
            thickness: 1,
            color: Color(0xFF2B2939),
          ),
        ],
      ),
    );
  }
}
