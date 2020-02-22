import 'package:flutter/material.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/ui/widget/widgets.dart';

class ListItem extends StatelessWidget {
  ListItem({Key key}) : super(key: key);
  final asset = new AssetResources();
  final listItemBloc = new ListItemBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: BlocBuilder(
        bloc: listItemBloc,
        builder: (BuildContext context, state) {
          if (state is ListItemInitial) {
            listItemBloc.add(ListItemInitialEvent());
            return Center(child: LoadingWidget());
          } else if (state is ListItemCompletedState) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(state.img),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: new BorderRadius.all(Radius.circular(10)),
                      ),
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Text(state.title,style:TextStyle(fontWeight: FontWeight.bold)),
                        Text(state.content,style:TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            );
          } else if (state is ListItemErrorState) {
            return Text("Error");
          }
        },
      ),
    );
  }
}
