

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 List<Map<String, dynamic>> storyList = [
    {
      "name":"sahaj",
      "imageUrl":"assets/human1.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name":"radhe",
      "imageUrl":"assets/human1.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name":"kanha",
      "imageUrl":"assets/human1.jpg",
      "isOnline":true,
      "hasStory": false,
    },
    {
      "name":"nimi",
      "imageUrl":"assets/human1.jpg",
      "isOnline":true,
      "hasStory":false,
    },
    {
      "name":"somu",
      "imageUrl":"assets/human1.jpg",
      "isOnline":false,
      "hasStory":true,
    },
    {
      "name":"risha",
      "imageUrl":"assets/human1.jpg",
      "isOnline":true,
      "hasStory":false,
    }
  ];



class Conversations extends StatefulWidget {
  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  TextEditingController _searchController = new TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "assets/human1.jpg"),
                          fit: BoxFit.cover)),
                ),
               const Text(
                  "Chats",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.edit)
              ],
            ),
           const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration:  BoxDecoration(
                color: Color(0xFFe9eaec),
                borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  cursorColor: Color(0xFF000000),
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF000000). withOpacity(0.5) ,
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
                  ),
                ),
                _stories(),
              
            
          ],
        ),
      )),
    );
  }
}

Widget _stories(){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: <Widget> [
      Padding(padding:const EdgeInsets.only(right: 20),
      child: Column(children:<Widget>[
        Container(
          width: 60,
          height: 60,
          decoration:const BoxDecoration( shape: BoxShape.circle, color: Color(0xFFe9eaec)),
          child: const Center(child: Icon(
            Icons.add,
            size: 33,
          ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
       const  SizedBox(
          width: 75,
          child: Align(
            child: Text(
              'Your Story',
              overflow: TextOverflow.ellipsis,
          )),
        )
      ],),
    ),
  Row(
    children: List.generate(storyList.length,(index){
      return Padding(padding: const EdgeInsets.only(right: 20),
      child: Column(children: <Widget>[
        SizedBox(
          width: 60,
          height: 60,
          child: Stack(children:<Widget>[
            storyList[index]['hasStory']
            ? Container(
               decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueAccent,width: 3
                )
               ),
               child: Padding( padding: const EdgeInsets.all(3.0),
               child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage( storyList[index]['imageUrl']),
                  fit: BoxFit.cover)),
               ),
               ),
            )
            :Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage( storyList[index]['imageUrl']),
                fit: BoxFit.cover)
              ),
            ),
               storyList[index]['isOnline']
               ? Positioned(top:38,
               left: 42,
               child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(color: Color(0xFF66BB6A),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFFFFFFF), width:3
                )),),):Container()],
            ),
          ),
         const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 75,
            child: Align(
              child: Text(
                storyList[index]['name'],
                overflow: TextOverflow.ellipsis,
              )),
          )
      ],
      ),
      );
    }))
    ],
    ),
  );
}
            