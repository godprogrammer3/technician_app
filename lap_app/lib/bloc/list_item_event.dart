part of 'list_item_bloc.dart';

abstract class ListItemEvent extends Equatable {
  const ListItemEvent();
}


class ListItemInitialEvent extends ListItemEvent{
  @override
  List<Object> get props => null;

}