import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:searchfilter/modal.dart';

class CarsolSlider extends StatefulWidget {
  String? id;
  JsonParser? faqData;
  CarsolSlider(this.faqData, this.id);
  @override
  State<CarsolSlider> createState() => CarsolSliderState(this.faqData, this.id);
}

class CarsolSliderState extends State<CarsolSlider> {
  @override
  String? id;
  JsonParser? faqData;
  List<String> title = [];
  List<String> ids = [];
  List<String> content = [];
  int? index;

  CarsolSliderState(this.faqData, this.id);

  @override
  void initState() {
    // TODO: implement initState
    setData();
    print("dkukjfaskf" + faqData.toString());
    https: //randomuser.me/api/
    super.initState();
  }

  void setData() {
    for (int i = 0; i < faqData!.faq.length; i++) {
      if (faqData!.faq != null) {
        if (id == faqData!.faq[i].id.toString()) {
          setState(() {
            index = i;
          });
        }
        ids.add(faqData!.faq[i].id.toString());
        title.add(faqData!.faq[i].title.toString());
        content.add(faqData!.faq[i].content.toString());
      }
      print("data" + content[0].toString());

      /* if (id == faqData!.faq[i].id.toString()) {
        ids?.add(faqData!.faq[i - 1].id.toString());
        ids?.add(faqData!.faq[i].id.toString());
        ids?.add(faqData!.faq[i + 1].id.toString());
        title?.add(faqData!.faq[i - 1].title.toString());
        title?.add(faqData!.faq[i].title.toString());
        title?.add(faqData!.faq[i + 1].title.toString());
        content?.add(faqData!.faq[i - 1].content.toString());
        content?.add(faqData!.faq[i].content.toString());
        content?.add(faqData!.faq[i + 1].content.toString());
      }*/
    }
  }
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Screen")),
      body: Container(
        padding: EdgeInsets.only(top: 50, bottom: 50),
        color: Colors.white,
        child: ids.length > 0
            ? CarouselSlider.builder(
                itemCount: ids.length,
                options: CarouselOptions(
                  initialPage: index!,
                  enlargeCenterPage: false,
                  height: screenHeight,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  reverse: false,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                Container(
                                  //ClipRRect for image border radius
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Id :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ids[i],
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //ClipRRect for image border radius
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Title :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: title[i],
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Html(
                                    data: content[i].toString(),
                                    shrinkWrap: true,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                },
              )
            : Container(),
      ),
    );
  }
}
