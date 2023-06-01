import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neumann_flutter/home/create_pub_request_model.dart';
import '../services/authentication_manager.dart';
import './message_service.dart';

class MessageController extends GetxController {
  final box = GetStorage();
  String nome = '';
  TextEditingController tec = TextEditingController();
  AuthenticationManager am = AuthenticationManager();
  MessageService ms = MessageService();

  Future<void> createPub() async {
    String? token = am.retrieveToken();
    String? autor = box.read('nome');
    await ms.createPub(
      CreatePubRequestModel(
        conteudo: tec.text,
        autor: autor ?? '',
      ),
      token,
    );
    tec.text = '';
  }
}
