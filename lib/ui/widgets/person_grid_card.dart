
import 'package:flutter/material.dart';
import 'package:flutter_simplecode_4_lesson/constants/app_colors.dart';
import 'package:flutter_simplecode_4_lesson/constants/app_styles.dart';
import 'package:flutter_simplecode_4_lesson/generated/l10n.dart';
import 'package:flutter_simplecode_4_lesson/models/Person.dart';
import 'package:flutter_simplecode_4_lesson/widgets/user_avatar.dart';

class PersonGridCard extends StatelessWidget {
  const PersonGridCard(this.person, {Key? key}) : super(key: key);

  final Person person;

  Color _statusColor(String? status) {
    if (status == 'Dead') return Colors.red;
    if (status == 'Alive') return const Color(0xff00c48c);
    return Colors.grey;
  }

  String _statusLabel(String? status) {
    if (status == 'Dead') return S.current.dead;
    if (status == 'Alive') return S.current.alive;
    return S.current.unknown;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAvatar(
          person.image,
          radius: 60.0,
          margin: const EdgeInsets.only(bottom: 20.0),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _statusLabel(person.status).toUpperCase(),
                      style: AppStyles.s10w500.copyWith(
                        letterSpacing: 1.5,
                        color: _statusColor(
                          person.status,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      person.name ?? S.of(context).unknown,
                      textAlign: TextAlign.center,
                      style: AppStyles.s16w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${person.species ?? S.of(context).unknown}, ${person.gender ?? S.of(context).unknown}',
                      style: const TextStyle(
                        color: AppColors.neutral2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
