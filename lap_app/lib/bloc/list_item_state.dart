part of 'list_item_bloc.dart';

abstract class ListItemState extends Equatable {
  const ListItemState();
}

class ListItemInitial extends ListItemState {
  @override
  List<Object> get props => [];
}

class  ListItemCompletedState extends ListItemState {
  final Uint8List img;
  final String title;
  final String content;

  ListItemCompletedState({
    @required this.img, 
    @required this.title, 
    @required this.content,
    });
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class ListItemErrorState  extends ListItemState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}