import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';
class NotificationPage extends StatelessWidget {
  final TokenCredential tokenCredential;

  const NotificationPage({Key key, 
  @required this.tokenCredential,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotificationBloc(),
      child: NotificationPageChild(tokenCredential: tokenCredential),
    );
  }
}

class NotificationPageChild extends StatelessWidget {
  final TokenCredential tokenCredential;
  List<Color> iconColor = <Color>[
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400],
    Color.fromARGB(255, 47, 220, 150),
  ];
  NotificationPageChild({Key key, 
    @required this.tokenCredential,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'การแจ้งเตือน',
          style: TextStyle(
              fontFamily: 'supermarket', fontSize: 20, color: Colors.black87),
        ),
        backgroundColor: Color(0xfafafa),
        elevation: 0,
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
                final waitTarkBloc = BlocProvider.of<NotificationBloc>(context);
                waitTarkBloc.add(NotificationChangePageEvent(pageIndex: 0));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.view_list,
                size: 30,
                color: iconColor[1],
              ),
              onPressed: () {
                final waitTarkBloc = BlocProvider.of<NotificationBloc>(context);
                waitTarkBloc.add(NotificationChangePageEvent(pageIndex: 1));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.event_note,
                size: 30,
                color: iconColor[2],
              ),
              onPressed: () {
                final waitTarkBloc = BlocProvider.of<NotificationBloc>(context);
                waitTarkBloc.add(NotificationChangePageEvent(pageIndex: 2));
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
      body: BlocListener<NotificationBloc,NotificationState>(
        bloc: BlocProvider.of<NotificationBloc>(context),
        listener:(BuildContext context, state) {
          if (state is NotificationChangePageState) {
            switch (state.pageIndex) {
              case 0:
                {
                  Navigator.of(context).pushReplacement(
                      _createRoute(HomePage(tokenCredential: tokenCredential)));
                  break;
                }
              case 1:
                {
                  Navigator.of(context).pushReplacement(_createRoute(
                      YourTaskPage(tokenCredential: tokenCredential)));
                  break;
                }
              case 2:
                {
                  Navigator.of(context).pushReplacement(_createRoute(
                      WaitTaskPage(tokenCredential: tokenCredential)));
                  break;
                }
            }
          }
        },
        child: buildBody(context)
        ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
            bottomLeft: const Radius.circular(10.0),
            bottomRight: const Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(1, -2),
                blurRadius: 5),
            BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(-1, 2),
                blurRadius: 5)
          ]),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListItem();
          }),
    );
  }
}

Route _createRoute(StatelessWidget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset.zero;
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
