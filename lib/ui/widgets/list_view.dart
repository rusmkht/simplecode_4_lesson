
// ignore: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_simplecode_4_lesson/models/Person.dart';
import 'package:flutter_simplecode_4_lesson/ui/widgets/person_list_card.dart';
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<Person> personsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(

      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      )
      ,
      itemCount: personsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: PersonListCard(personsList[index]),
          onTap: () {},
        );
      },
      separatorBuilder: (context, _) => const SizedBox(height: 26.0),
    );
  }
}
