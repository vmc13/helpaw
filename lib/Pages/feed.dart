import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

    int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Profile',
      style: optionStyle,
    ),
    Text(
      'Index 1: News',
      style: optionStyle,
    ),
    Text(
      'Index 2: Post',
      style: optionStyle,
    ),
    Text(
      'Index 3: Notifications',
      style: optionStyle,
    ),
    Text(
      'Index 4: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8 ,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                children: [
                  Text(
                    'Helpaw',
                    style: TextStyle(
                    color: Color.fromRGBO(156, 39, 176, 1),
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(
                  height: 50,
                  child: Image.asset("images/logo_paw.png"),
                  ),
                ],
              ),
                Row(
                  children: [
                    Container(
                      width: 35,
                      child: IconButton(
                        onPressed: (){print('SEARCH');}, 
                        icon: Icon(Icons.search), iconSize: 30, color: Colors.purple[700],),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(width: 10);
                }
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(
                      color: Colors.black45, 
                      offset: Offset(0, 2),
                      blurRadius: 6
                    )]
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.purple[200],
                    child: ClipOval(
                      child: Image(
                        height: 60,
                        width: 60,
                        image: NetworkImage('https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        fit:  BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
              ),
          ),
          //POST 1
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              width: double.infinity,
              height: 560,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(
                                color: Colors.black45, 
                                offset: Offset(0, 2),
                                blurRadius: 6
                              )]
                            ),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage('https://images.pexels.com/photos/825949/pexels-photo-825949.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1g'),
                                  fit:  BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'user.00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          subtitle: Text('Há 8 horas'),
                          trailing: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                            color: Colors.purple[800],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 5),
                                blurRadius: 8
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage('https://images.pexels.com/photos/662417/pexels-photo-662417.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 30,
                                      color: Colors.purple[800],
                                    ),
                                    Text(
                                      '864',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple[800],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.chat),
                                      iconSize: 30,
                                      color: Colors.purple[800],
                                    ),
                                    Text(
                                      '150',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple[800],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.share),
                                      iconSize: 30,
                                      color: Colors.purple[800],
                                    ),
                                  ],
                                ),
                              ],),
                              IconButton(
                                onPressed: (){}, 
                                icon: Icon(Icons.bookmark_border),
                                iconSize: 30,
                                color: Colors.purple[800],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //POST 2
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              width: double.infinity,
              height: 560,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(
                                color: Colors.black45, 
                                offset: Offset(0, 2),
                                blurRadius: 6
                              )]
                            ),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage('https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                  fit:  BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'user.01',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          subtitle: Text('Há 8 horas'),
                          trailing: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                            color: Colors.purple[800],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 5),
                                blurRadius: 8
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage('https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 30,
                                      color: Colors.purple[800],
                                    ),
                                    Text(
                                      '864',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple[800],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.chat),
                                      iconSize: 30,
                                      color: Colors.purple[800],
                                    ),
                                    Text(
                                      '150',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ],),
                              IconButton(
                                onPressed: (){}, 
                                icon: Icon(Icons.bookmark_border),
                                iconSize: 30,
                                color: Colors.purple[800],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //POST 3
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              width: double.infinity,
              height: 560,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(
                                color: Colors.black45, 
                                offset: Offset(0, 2),
                                blurRadius: 6
                              )]
                            ),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage('https://images.pexels.com/photos/2023384/pexels-photo-2023384.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                  fit:  BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'user.02',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          subtitle: Text('Há 12 horas'),
                          trailing: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_horiz),
                            color: Colors.purple[800],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 5),
                                blurRadius: 8
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage('https://images.pexels.com/photos/686094/pexels-photo-686094.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 30,
                                      color: Colors.purple[800],
                                    ),
                                    Text(
                                      '864',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple[800],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){}, 
                                      icon: Icon(Icons.chat),
                                      iconSize: 30,
                                      color: Colors.purple[800],
                                    ),
                                    Text(
                                      '150',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ],),
                              IconButton(
                                onPressed: (){}, 
                                icon: Icon(Icons.bookmark_border),
                                iconSize: 30,
                                color: Colors.purple[800],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.purple[100],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Post',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.purple,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[900],
          onTap: _onItemTapped,
        ),
    );
  }

}