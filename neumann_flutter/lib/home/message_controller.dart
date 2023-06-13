import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neumann_flutter/home/create_pub_request_model.dart';
import '../services/authentication_manager.dart';
import './message_service.dart';
import 'create_pub_response_model.dart';
import 'update_pub_request_model.dart';
import 'update_pub_response_model.dart';

class MessageController extends GetxController {
  final box = GetStorage();
  String nome = '';
  String id = '';
  bool editarPub = false;
  TextEditingController tec = TextEditingController();
  AuthenticationManager am = AuthenticationManager();
  MessageService ms = MessageService();
  Rx<UpdatePubResponseModel> response = UpdatePubResponseModel(msg: "").obs;
  Future<String> createPub() async {
    if (tec.text.isNotEmpty) {
      String? token = am.retrieveToken();
      String? autor = box.read('nome');
      CreatePubResponseModel response = await ms.createPub(
        CreatePubRequestModel(
          conteudo: tec.text,
          autor: autor ?? '',
        ),
        token,
      );
      tec.text = '';
      return response.message;
    }
    return "Adicione valores válidos!";
  }

  Future<String> updatePub() async {
    if (tec.text.isNotEmpty) {
      String? token = am.retrieveToken();
      response.value = await ms.updatePub(
        UpdatePubRequestModel(
          conteudo: tec.text,
        ),
        token,
        id,
      );
      tec.text = '';
      editarPub = false;
      return response.value.msg;
    }

    return "Adicione valores válidos!";
  }
}
