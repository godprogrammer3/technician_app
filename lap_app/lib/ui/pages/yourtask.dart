import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';

class YourTaskPage extends StatelessWidget {
  final TokenCredential tokenCredential;

  const YourTaskPage({Key key, this.tokenCredential}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YourTaskBloc(),
      child: YourTaskPageChild(
        tokenCredential: tokenCredential,
      ),
    );
  }
}

class YourTaskPageChild extends StatelessWidget {
  final TokenCredential tokenCredential;

  List<Color> iconColor = <Color>[
    Colors.grey[400],
    Color.fromARGB(255, 47, 220, 150),
    Colors.grey[400],
    Colors.grey[400],
  ];

  YourTaskPageChild({
    Key key,
    @required this.tokenCredential,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ListTile(
            title: Text(
              'Your Task',
              style: TextStyle(
                  fontFamily: 'supermarket',
                  fontSize: 23,
                  color: Colors.black87),
            ),
            subtitle: Text(
              '14 มกราคม 2562',
              style: TextStyle(
                  fontFamily: 'supermarket', fontSize: 17, color: Colors.grey),
            ),
          ),
          backgroundColor: Color(0xfafafa),
          elevation: 0),
      body: BlocListener<YourTaskBloc, YourTaskState>(
        bloc: BlocProvider.of<YourTaskBloc>(context),
        listener: (BuildContext context, state) {
          if (state is YourTaskChangePageState) {
            switch (state.pageIndex) {
              case 0:
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<YourTaskBloc>(context),
                        child: HomePage(tokenCredential: tokenCredential)),
                  ));
                  break;
                }
              case 2:
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<YourTaskBloc>(context),
                        child: WaitTaskPage(tokenCredential: tokenCredential)),
                  ));
                  break;
                }
            }
          }
        },
        child: buildBody(context),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: 30,
                color: iconColor[0],
              ),
              onPressed: () {
                final yourTarkBloc = BlocProvider.of<YourTaskBloc>(context);
                yourTarkBloc.add(YourTaskChangePageEvent(pageIndex: 0));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.view_list,
                size: 30,
                color: iconColor[1],
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.event_note,
                size: 30,
                color: iconColor[2],
              ),
              onPressed: () {
                final yourTarkBloc = BlocProvider.of<YourTaskBloc>(context);
                yourTarkBloc.add(YourTaskChangePageEvent(pageIndex: 2));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_active,
                size: 30,
                color: iconColor[3],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   title:ListTile(
        //     title: Text('งานเสร็จพร้อมตรวจสอบ', style: TextStyle(fontFamily: 'supermarket',fontSize:23,color: Colors.black87),),
        //     subtitle: Text('14 มกราคม 2562', style: TextStyle(fontFamily: 'supermarket',fontSize:17,color: Colors.grey),),
        //   ),
        //   pinned: true,
        //   elevation: 0,
        //   backgroundColor: Color(0xfafafa),
        //   //floating:true,
        //   brightness:Brightness.dark,
        //   //expandedHeight: 200,
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index.isEven) {
                return Padding(
                    child: buildTask(context), padding: EdgeInsets.all(7));
              }
              return Divider(height: 0, color: Colors.white);
            },
            childCount: 10,
          ),
        )
      ],
    );
  }
}
