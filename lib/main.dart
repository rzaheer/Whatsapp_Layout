import 'package:flutter/material.dart';


void main() => runApp(MyApp());



class Chats extends StatefulWidget{

  ChatsState createState() => ChatsState();

}

class ChatsState extends State<Chats>{


  List<String> names = [
    'Sender 1',
    'Sender 2',
    'Sender 3',
    'Sender 4',
    'Sender 5',
    'Sender 6',
    'Sender 7',
    'Sender 8',
  ];

  List<String> text = [
    'some message here...',
    'some message here...',
    'some message here...',
    'some message here...',
    'some message here...',
    'some message here...',
    'some message here...',
    'some message here...',
    'some message here...'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF25d366),
          child: Center(child: Icon(Icons.message),
          ),
          onPressed: null
      ),
      body: Container(
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index){
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(),
                    title: Text(names[index]),
                    subtitle: Text(text[index]),
                    trailing: Text(''),
                  ),
                ],
              );
            }),
      ),
    );
  }

}




class MyApp extends StatefulWidget{

  MyAppState createState() => MyAppState();

}
class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  TabController _tabController;
  ScrollController _scrollController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4 );
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  Icon(Icons.search),
                  Container(width: 15.0,),
                  Icon(Icons.more_vert),
                  Container(width: 20.0,),
                ],
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                floating: true,
                centerTitle: false,
                backgroundColor: Color(0xFF075e54),
                title: Text('WhatsApp'),
                bottom: TabBar(
                    indicatorWeight: 5.0,
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Icon(Icons.photo_camera),
                      ),
                      Tab(
                        text: 'CHATS',
                      ),
                      Tab(
                        text: 'STATUS',
                      ),
                      Tab(
                        text: 'CALLS',
                      ),

                    ]
                ),
              )
            ];
          },
          body: TabBarView(
              controller: _tabController,
              children: [
                Text(''),
                Chats(),
                Text(''),
                Text(''),
                
        
                                                
              ]
            ),
          ),
       ),
   );
    }
                                                


  

}