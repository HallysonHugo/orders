import 'package:flutter/material.dart';

enum PopupEnum{
  alterar('Alterar', Icons.edit, Colors.greenAccent),
  excluir('Excluir', Icons.delete, Colors.red);

  const PopupEnum(this.descricao, this.icon, this.color);
  final String descricao;
  final IconData icon;
  final Color color;
}