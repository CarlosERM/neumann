import 'package:get/get.dart';
import 'package:neumann_flutter/home/update_pub_request_model.dart';
import 'package:neumann_flutter/research_projects/get_research_projects_response.dart'
    as get_research;
import 'package:neumann_flutter/research_projects/update_project_request_model.dart';
import 'package:neumann_flutter/research_projects/update_project_response_model.dart';
import 'package:neumann_flutter/util/routes.dart';
import '../../services/authentication_manager.dart';
import 'create_project_request_model.dart' as create_project_request;
import 'create_project_response_model.dart' as create_project_response;
import 'research_projects_service.dart';

class ResearchProjectsController extends GetxController with StateMixin {
  late String projectId;
  late final ResearchProjectsService projectService;
  AuthenticationManager am = AuthenticationManager();
  late RxList<get_research.GetResearchProjectsResponse> projects =
      <get_research.GetResearchProjectsResponse>[].obs;
  @override
  void onInit() {
    super.onInit();
    projectService = Get.put(ResearchProjectsService());
  }

  Future<List<get_research.GetResearchProjectsResponse>>
      getAllResearchProjects() async {
    String? token = am.retrieveToken();
    projects.value = await projectService.fetchProjects(token);
    projects.refresh();
    return projects.value;
  }

  Future<String> createProject(String nome, String descricao,
      List<create_project_request.Participante> participantes) async {
    String? token = am.retrieveToken();
    create_project_response.CreateProjectResponseModel project =
        await projectService.createProject(
      create_project_request.CreateProjectRequestModel(
        nome: nome,
        descricao: descricao,
        participantes: participantes,
      ),
      token,
    );
    return project.message;
  }

  Future<String> updateProject(String nome, String descricao,
      List<create_project_request.Participante> participantes) async {
    String? token = am.retrieveToken();
    UpdateProjectResponseModel project = await projectService.updateProject(
        UpdateProjectRequestModel(nome: nome, descricao: descricao),
        token,
        projectId);

    return project.msg;
  }
}
