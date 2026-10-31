import 'package:flutter/material.dart';
import 'package:moodairy/helpers/db_helper.dart';
import 'package:moodairy/helpers/mooddata.dart';
import 'package:moodairy/models/moodcard.dart';
import 'package:moodairy/widgets/moodDayCard.dart';
import 'package:provider/provider.dart';

class OldHomeScreen extends StatefulWidget {
  @override
  _OldHomeScreenState createState() => _OldHomeScreenState();
}

class _OldHomeScreenState extends State<OldHomeScreen> {
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    loader = Provider.of<MoodCard>(context, listen: true).isloading;
    return loader
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('Your Moods'),
              backgroundColor: Colors.red,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.show_chart),
                    onPressed: () => Navigator.of(context).pushNamed('/chart'))
              ],
            ),
            body: FutureBuilder<List<Map<String, dynamic>>>(
              future: DBHelper.getData('user_moods'),
              initialData: const [],
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, int position) {
                          final row = snapshot.data![position];
                          var imagestring = row['actimage'];
                          List<String> img = imagestring.split('_');
                          List<String> name = row['actname'].split("_");
                          Provider.of<MoodCard>(context, listen: false)
                              .actiname
                              .addAll(name);
                          Provider.of<MoodCard>(context, listen: false)
                              .data
                              .add(MoodData(
                                  row['mood'] == 'Angry'
                                      ? 1
                                      : row['mood'] == 'Happy'
                                          ? 2
                                          : row['mood'] == 'Sad'
                                              ? 3
                                              : row['mood'] == 'Surprised'
                                                  ? 4
                                                  : row['mood'] == 'Loving'
                                                      ? 5
                                                      : row['mood'] == 'Scared'
                                                          ? 6
                                                          : 7,
                                  row['date'],
                                  row['mood'] == 'Angry'
                                      ? Colors.red
                                      : row['mood'] == 'Happy'
                                          ? Colors.blue
                                          : row['mood'] == 'Sad'
                                              ? Colors.green
                                              : row['mood'] == 'Surprised'
                                                  ? Colors.pink
                                                  : row['mood'] == 'Loving'
                                                      ? Colors.purple
                                                      : row['mood'] == 'Scared'
                                                          ? Colors.black
                                                          : Colors.white));

                          return MoodDay(row['image'], row['datetime'],
                              row['mood'], img, name);
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          );
  }
}
