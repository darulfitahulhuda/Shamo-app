part of 'home.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    return Scaffold(
      body: StreamBuilder<List<Message>>(
          stream: MessageServices()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return CustomPage(
                  appBarText: 'Message Chat',
                  buttonTap1: () {
                    pageProvider.currentIndex = 0;
                  },
                  buttonTitle1: 'Explore Now',
                  image: 'assets/icon_headset.png',
                  subtitle: 'You have never done a transaction',
                  title: 'Opss no message yet?',
                );
              }
              return Column(
                children: [
                  Header(
                    title: 'Message Support',
                  ),
                  Expanded(
                    child: Container(
                      color: backgroundColor3,
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: ListView(
                        children: [
                          ChatTile(
                            message:
                                (snapshot.data![snapshot.data!.length - 1]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return CustomPage(
                appBarText: 'Message Chat',
                buttonTap1: () {
                  pageProvider.currentIndex = 0;
                },
                buttonTitle1: 'Explore Now',
                image: 'assets/icon_headset.png',
                subtitle: 'You have never done a transaction',
                title: 'Opss no message yet?',
              );
            }
          }),
    );
  }
}
