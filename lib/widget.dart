import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchfilter/service.dart';

import 'CarsolSlider.dart';
import 'modal.dart';

class DataView extends StatefulWidget {
  const DataView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DataView> createState() => DataViewState();
}

class DataViewState extends State<DataView> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Filter Search'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  JsonParser? faqData;
  TextEditingController searchController = TextEditingController();

  List<String> title = [];
  @override
  void initState() {
    // TODO: implement initState
    launchUrl();
    https: //randomuser.me/api/
    super.initState();
  }

  void launchUrl() async {
    debugPrint('Enter getCheckList');
    //faqData.faq.clear();

    JsonParser? receivedData = await FilterService.getFaqJsonData();
    setState(() {
      if (receivedData != null) {
        faqData = receivedData;
      }
    });

    faqData?.faq.forEach((value) {
      debugPrint('Tabname: ${value.title}');
      title.add(value.title);
    });

    debugPrint('Exit getCheckList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: serachData,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: title.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarsolSlider(
                                        faqData,
                                        faqData?.faq[index].id
                                            .toString()) /*ScreenTwo(faqData?.faq[index].id)*/));
                          },
                          title: Text(
                            title[index],
                          ));
                    }))
          ],
        ),
      ),
    );
  }

  void serachData(String value) {
    print("Hii" + value);
    List<String> searchResult = [];
    List<String> searchFrom = [];
    faqData?.faq.forEach((value) {
      debugPrint('Tabname: ${value.title}');
      setState(() {
        searchFrom.add(value.title);
      });
    });
    searchResult.clear();
    if (value.isNotEmpty) {
      searchResult = searchFrom.where((element) {
        return element.toLowerCase().contains(value.toLowerCase().trim());
      }).toList();
    }

    title.clear();
    print(searchResult.toString());
    if (searchResult.length > 0) {
      setState(() {
        title = searchResult;
      });
      //searchResult.clear();
    } else {
      setState(() {
        title = searchFrom;
      });
    }
    //searchResult.clear();
  }
}
