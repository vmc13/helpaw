import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed Helpaw"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) => newCard()),
    );
  }

  Card newCard() {
    return Card(
          child: Container(
            height: 350,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(),
                  title: Text('Tatic Developer'),
                  subtitle: Text("Tue Nov 29 2022 18:35 (Brazil)"),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/feed/post1.jpg"),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.thumb_up, color: Colors.purple),
                        Text(" Like", style: TextStyle(color: Colors.purple),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.comment, color: Colors.purple),
                        Text(" Comment", style: TextStyle(color: Colors.purple))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.share, color: Colors.purple),
                        Text(" Share", style: TextStyle(color: Colors.purple))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        );
  }
}