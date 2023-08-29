import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowscaseDemo extends StatelessWidget {
  const ShowscaseDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ShowCase Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShowCaseWidget(
          builder: Builder(builder: (context) => const ShowcaseDemo()),
        ),
      ),
    );
  }
}

class ShowcaseDemo extends StatefulWidget {
  const ShowcaseDemo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowcaseDemoState createState() => _ShowcaseDemoState();
}

class _ShowcaseDemoState extends State<ShowcaseDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey first = GlobalKey();
  final GlobalKey second = GlobalKey();
  final GlobalKey third = GlobalKey();
  final GlobalKey fourth = GlobalKey();
  final GlobalKey fifth = GlobalKey();
  final GlobalKey six = GlobalKey();
  List<ChatUsers> chatUsers = [];

  @override
  void initState() {
    super.initState();
    loadData();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)
          .startShowCase([first, second, third, fourth,  six,fifth]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.6),
              ),
              child: const Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(0.6),
        leading: Showcase(
          key: first,
          description: 'Press here to open drawer',
          child: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          Showcase(
              key: third,
              description: 'Press to see notification',
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active)))
        ],
        title: Showcase(
            key: second,
            description: 'This is a demo app title',
            child: const Text('DevDiariesWithVee')),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: chatUsers.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        index == 0
                            ? Showcase(
                                key: fourth,
                                description: 'This is sender\'s Profile',
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(chatUsers[index].imageURL),
                                  maxRadius: 30,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    AssetImage(chatUsers[index].imageURL),
                                maxRadius: 30,
                              ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chatUsers[index].name,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                index == 0
                                    ? Showcase(
                                        key: six,
                                        description:
                                            'This is sender\'s Message',
                                        child: Text(
                                          chatUsers[index].messageText,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : Text(
                                        chatUsers[index].messageText,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    chatUsers[index].time,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Showcase(
        key: fifth,
        title: 'Add Image',
        description: 'Click here to add new Item',
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple.withOpacity(0.6),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  loadData() {
    chatUsers.add(ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "assets/images/1.jpg",
        time: "Now"));
    chatUsers.add(
      ChatUsers(
          name: "Jorge Henry",
          messageText: "Hey where are you?",
          imageURL: "assets/images/2.jpg",
          time: "31 Mar"),
    );
    chatUsers.add(
      ChatUsers(
          name: "Philip Fox",
          messageText: "Busy! Call me in 20 mins",
          imageURL: "assets/images/3.jpg",
          time: "28 Mar"),
    );
    chatUsers.add(
      ChatUsers(
          name: "John Wick",
          messageText: "How are you?",
          imageURL: "assets/images/4.jpg",
          time: "18 Feb"),
    );
  }
}

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time});
}
