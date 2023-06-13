import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neumann_flutter/participante_model.dart';

import '../../services/cache_manager.dart';
import '../research_project/research_project_controller.dart';
import '../research_projects_service.dart';
import '../register_research_project_form/update_project_request_model.dart';
import '../register_research_project_form/update_project_response_model.dart';

class MyCardController extends GetxController with CacheManager {
  late final ResearchProjectsService projectService;
  final box = GetStorage();

  @override
  void onInit() {
    projectService = Get.put(ResearchProjectsService());
    super.onInit();
  }

  Future<String> toggleProject(String idProject, String title,
      String description, List<Participante> members) async {
    String? token = getToken();
    String id = await box.read('id');
    String name = await box.read('nome');
    Participante newMember = Participante(participante: name, id: id);

    if (!members.contains(newMember)) {
      print("Não tem lá dentro");
      members.add(newMember);
    }

    UpdateProjectResponseModel project = await projectService.updateProject(
        UpdateProjectRequestModel(
            nome: title, descricao: description, participantes: members),
        token,
        idProject);
    return project.msg;
  }
}
