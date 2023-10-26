import 'package:coffee_app_new/components/constants/colors.dart';
import 'package:coffee_app_new/components/constants/font_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainbg,
      appBar: AppBar(
          backgroundColor: mainTitles,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const AppBarTitle()),
      body: Center(
        child: Column(
          children: [
            MyHeadings(data: 'App Info'),
            Container(
              decoration: BoxDecoration(
                  color: subTitles, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/logo.png',
                height: 250,
              ),
            ),
            Text(
              'Version: 1.0.0+1',
              style: TextStyle(
                  color: mainTitles,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.copyright,
                  color: mainTitles,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '2023-2024 - Akhil James',
                    style: TextStyle(
                      color: mainTitles,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: mainTitles),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: ((ctx) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainTitles,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '9072748300',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton.icon(
                                      onPressed: () {
                                        _dialNumber('9072748300');
                                      },
                                      icon: Icon(
                                        Icons.call,
                                        color: white,
                                      ),
                                      label: Text(
                                        'Call Now',
                                        style: TextStyle(color: white),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'akhiljames835@gmail.com',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton.icon(
                                      onPressed: () {
                                        launchEmailSubmission();
                                      },
                                      icon: Icon(
                                        Icons.email,
                                        color: white,
                                      ),
                                      label: Text(
                                        'Send mail',
                                        style: TextStyle(color: white),
                                      )),
                                ],
                              ),
                              Text(
                                'My Address',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }));
                },
                icon: Icon(
                  Icons.contact_page_rounded,
                  color: white,
                ),
                label: const Text('Contact Developer'))
          ],
        ),
      ),
    );
  }

  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> launchEmailSubmission() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'akhiljames835@gmail.com',
        query: 'subject=From Coffee Break');

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      debugPrint('Could not launch $params');
    }
  }
}
