import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sport_bar/utils/popupenum.dart';

class CustomPopupMenuButtom extends StatelessWidget {
  final FutureOr<void> Function() onChange;
  final FutureOr<void> Function() onDelete;
  const CustomPopupMenuButtom({super.key, required this.onChange, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupEnum>(
      onSelected: (PopupEnum result)async{
        switch(result){
          case PopupEnum.alterar:
            await onChange();
            break;
          case PopupEnum.excluir:
            await onDelete();
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupEnum>>[
        PopupMenuItem<PopupEnum>(
          value: PopupEnum.alterar,
          child: Row(
            children: [
              Icon(PopupEnum.alterar.icon, color: PopupEnum.alterar.color,),
              Text(PopupEnum.alterar.descricao),
            ],
          ),
        ),
          PopupMenuItem<PopupEnum>(
          value: PopupEnum.excluir,
          child: Row(
            children: [
              Icon(PopupEnum.excluir.icon, color: PopupEnum.excluir.color,),
              Text(PopupEnum.excluir.descricao),
            ],
          ),
        ),
      ],
    );
  }
}