import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/list/cubit/list_cubit.dart';
import 'package:fitness_app/list/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AutoSizeText('Complex List')),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (context, state) {
          switch (state.status) {
            case ListStatus.failure:
              return const Center(
                  child: AutoSizeText('Oops something went wrong!'));
            case ListStatus.success:
              return _ListView(items: state.items);
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: AutoSizeText('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _ItemTile(
                item: items[index],
                onDeletePressed: (id) {
                  context.read<ListCubit>().deleteItem(id);
                },
              );
            },
            itemCount: items.length,
          );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    Key key,
    @required this.item,
    @required this.onDeletePressed,
  }) : super(key: key);

  final Item item;
  final ValueSetter<String> onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AutoSizeText('#${item.id}'),
      title: AutoSizeText(item.value),
      trailing: item.isDeleting
          ? const CircularProgressIndicator()
          : IconButton(
              icon: const Icon(Icons.delete,
                  color: Color.fromRGBO(197, 0, 14, 1)),
              onPressed: () => onDeletePressed(item.id),
            ),
    );
  }
}
