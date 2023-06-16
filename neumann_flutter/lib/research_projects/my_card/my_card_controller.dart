import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neumann_flutter/participante_model.dart';
import '../../services/cache_manager.dart';
import '../research_projects_service.dart';
import '../register_research_project_form/update_project_request_model.dart';
import '../register_research_project_form/update_project_response_model.dart';

class MyCardController extends GetxController with CacheManager {
  late final ResearchProjectsService projectService;
  final box = GetStorage();
  late List<Participante> members;
  Rx<bool> canEnter = true.obs;
  late final String id;

  @override
  void onInit() {
    projectService = Get.put(ResearchProjectsService());
    id = box.read('id');
    super.onInit();
  }

  void isInside() {
    for (var i = 0; i < members.length; i++) {
      if (members[i].id == id) {
        canEnter.value = false;
      }
    }
    print(canEnter.value);
  }

  Future<String> toggleProject(String idProject, String title,
      String description, List<Participante> members) async {
    String? token = getToken();

    String name = await box.read('nome');
    Participante newMember = Participante(participante: name, id: id);
    isInside();
    if (canEnter.value) {
      members.add(newMember);
    } else {
      return "Já entrou";
    }
    UpdateProjectResponseModel project = await projectService.updateProject(
        UpdateProjectRequestModel(
            nome: title, descricao: description, participantes: members),
        token,
        idProject);
    return project.msg;
  }
}
