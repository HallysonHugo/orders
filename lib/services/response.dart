
import 'package:flutter/material.dart';
import 'package:sport_bar/services/errors/exeption.dart';

enum Status { loading, completed, error, none }

class CustomResponse<T> {
  Status? status;
  T? data;
  CustomException? error;

  CustomResponse({this.status, this.data, this.error});

  CustomResponse.loading() : status = Status.loading;
  CustomResponse.completed({@required this.data}) : status = Status.completed;
  CustomResponse.error({@required this.error}) : status = Status.error;
  CustomResponse.none() : status = Status.none;

  bool get isLoading => status == Status.loading;
  bool get isCompleted => status == Status.completed;
  bool get hasError => status == Status.error;
  bool get hasNone => status == Status.none;
}
