import 'package:flutter/material.dart';
import 'package:flutter_simplecode_4_lesson/constants/app_colors.dart';
import 'package:flutter_simplecode_4_lesson/constants/app_styles.dart';
import 'package:flutter_simplecode_4_lesson/generated/l10n.dart';
import 'package:flutter_simplecode_4_lesson/models/Person.dart';
import 'package:flutter_simplecode_4_lesson/ui/widgets/grid_view.dart';
import 'package:flutter_simplecode_4_lesson/ui/widgets/list_view.dart';

import 'package:flutter_simplecode_4_lesson/ui/widgets/search.dart';



class PersonsList extends StatefulWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  State<PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  var isListView = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SearchTextField(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).personsTotal.toUpperCase() + ":${_personsList.length}",
                      style: AppStyles.s10w500.copyWith(
                        letterSpacing: 1.5,
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(isListView ? Icons.list : Icons.grid_view),
                    iconSize: 28.0,
                    color: AppColors.neutral2,
                    onPressed: () {
                      setState(() {
                        isListView = !isListView;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: isListView
                  ? ListViewWidget(personsList: _personsList)
                  : GridViewWidget(personsList: _personsList),
            ),
          ],
        ),
      ),
    );
  }
}

final _list = [
  const Person(
    name: 'Рик Санчез',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Алан Райс',
    species: 'Человек',
    status: 'Dead',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Саммер Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Женский',
  ),
  const Person(
    name: 'Морти Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
];

final _personsList = [
  ..._list,
  ..._list,
  ..._list,
  ..._list,
];
