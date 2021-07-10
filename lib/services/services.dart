import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/model/model.dart';
import 'package:http/http.dart' as http;

part 'auth_services.dart';
part 'product_services.dart';
part 'transaction_services.dart';
part 'message_services.dart';

String baseUrl = 'https://shamo-backend.buildwithangga.id/api/';
