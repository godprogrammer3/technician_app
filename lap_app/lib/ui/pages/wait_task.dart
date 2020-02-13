import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/bloc/wait_task_bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';

class WaitTaskPage extends StatelessWidget {
  final TokenCredential tokenCredential;

  const WaitTaskPage({
    Key key,
    @required this.tokenCredential,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => WaitTaskBloc(),
      child: WaitTaskPageChild(),
    );
  }
}

class WaitTaskPageChild extends StatelessWidget {
  final TokenCredential tokenCredential;

  List<Color> iconColor = <Color>[
    Colors.grey[400],
    Colors.grey[400],
    Color.fromARGB(255, 47, 220, 150),
    Colors.grey[400],
  ];

  WaitTaskPageChild({Key key, this.tokenCredential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ListTile(
            title: Text(
              'งานเสร็จพร้อมตรวจสอบ',
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
      body: BlocListener<WaitTaskBloc, WaitTaskState>(
        listener: (context, state) {
          if (state is WaitTaskChangePageState) {
            switch (state.pageIndex) {
              case 0:
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<WaitTaskBloc>(context),
                        child: HomePage(tokenCredential: tokenCredential)),
                  ));
                  break;
                }
              case 1:
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<WaitTaskBloc>(context),
                        child: YourTaskPage(tokenCredential: tokenCredential)),
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
                Icons.home,
                size: 30,
                color: iconColor[0],
              ),
              onPressed: () {
                final yourTarkBloc = BlocProvider.of<WaitTaskBloc>(context);
                yourTarkBloc.add(WaitTaskChangePageEvent(pageIndex: 0));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.view_list,
                size: 30,
                color: iconColor[1],
              ),
              onPressed: () {
                final yourTarkBloc = BlocProvider.of<WaitTaskBloc>(context);
                yourTarkBloc.add(WaitTaskChangePageEvent(pageIndex: 1));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.event_note,
                size: 30,
                color: iconColor[2],
              ),
              onPressed: () {},
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
  Widget buildBody(BuildContext context){
      return  Container(
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (BuildContext context,int index){
            return 
               buildTask(context);
            
          },
          separatorBuilder: (BuildContext context,int index)=>const Divider(),
        )
      );
      
      
      // Stack(
      //   children:<Widget>[
      //     Align(
      //       alignment:Alignment(MediaQuery.of(context).size.width * 0.0008, 0),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children:<Widget>[ 
      //           Container(
      //             decoration: new BoxDecoration(
      //               color: new Color.fromARGB(255, 240, 240, 240),
      //               borderRadius: BorderRadius.all(Radius.circular(8.0)),),
      //             width: 365,
      //             height: 177,
                  
      //           ),]

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
                    child: waittTask(context), padding: EdgeInsets.all(7));
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
