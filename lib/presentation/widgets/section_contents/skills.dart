// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/skills/skill_iconbutton.dart';

import 'package:portfolio/core/constants/constants.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Spacer(),
                  SkillIconButton(
                    skill: skill,
                  ),
                  const Spacer(),
                  const Spacer(),
                  Container(
                    width: size.width * .5,
                    constraints: const BoxConstraints(maxWidth: 600),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        LinearProgressIndicator(
                          value: skill.percentage,
                          minHeight: 16,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.4),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          '${skill.percentage * 100}%',
                          style: TextStyle(
                              color: skill.percentage <= .47
                                  ? Theme.of(context).colorScheme.inverseSurface
                                  : Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
