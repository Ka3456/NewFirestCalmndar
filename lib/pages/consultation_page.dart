import 'package:flutter/material.dart';
import 'package:firstcalendar/utils/colors.dart';
import 'package:firstcalendar/widget/news_article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatelessWidget {
  bool isback;
  SearchPage({super.key, this.isback = false});

  @override
  Widget build(BuildContext context) {
    print('初期化');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        automaticallyImplyLeading: isback,
        title: const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10.0),
          child: Text(
            '新着記事',
            style: TextStyle(color: lettercolor),
          ),
        ),
      ),
      backgroundColor: mobileBackgroundColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                    child: NewsArticle(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  ));
        },
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(home: SearchPage()));
// }
