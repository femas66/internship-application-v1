import 'package:flutter/material.dart';
import 'package:pkl_apps/modules/journal/journal_detail_screen.dart';
import 'package:pkl_apps/modules/journal/upload_journal_screen.dart';
import 'package:pkl_apps/services/journal_service.dart';

class JournalScreen extends StatefulWidget {
  static const String routeName = '/journal-screen';
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  late JournalService journal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    journal = JournalService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jurnal")),
      body: ListView(children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, UploadJournalScreen.routeName);
            },
            child: Text("Upload jurnal")),
        FutureBuilder(
            future: journal.getJournal(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, JournalDetailScreen.routeName,
                            arguments: {
                              "journal": item,
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        margin: EdgeInsets.fromLTRB(4, 12, 4, 12),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.date.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Text(item.activity.toString(),
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Text("Error : ${snapshot.error}");
              }
            })
      ]),
    );
  }
}
