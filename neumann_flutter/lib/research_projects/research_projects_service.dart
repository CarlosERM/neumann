import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:neumann_flutter/research_projects/register_research_project_form/update_project_request_model.dart';
import 'package:neumann_flutter/research_projects/register_research_project_form/update_project_response_model.dart';
import 'register_research_project_form/create_project_request_model.dart';
import 'register_research_project_form/create_project_response_model.dart';
import 'get_research_projects_response.dart';

class ResearchProjectsService extends GetConnect {
  final String projectsURL =
      "${dotenv.get('URL', fallback: 'API_URL not found')}project/";
  Future<List<GetResearchProjectsResponse>> fetchProjects(String? token) async {
    try {
      final response = await get(projectsURL, headers: {
        "Authorization": token!,
      });
      if (response.statusCode == HttpStatus.ok) {
        List<GetResearchProjectsResponse> result = [];
        (response.body).forEach((element) {
          result.add(GetResearchProjectsResponse.fromJson(element));
        });
        return result;
      } else {
        List<GetResearchProjectsResponse> result = [];
        return result;
      }
    } catch (e) {
      List<GetResearchProjectsResponse> result = [];
      return result;
    }
  }

  Future<CreateProjectResponseModel> createProject(
    CreateProjectRequestModel model,
    token,
  ) async {
    final response = await post(projectsURL, model.toJson(), headers: {
      "Authorization": token!,
    });
    if (response.statusCode == HttpStatus.created) {
      Get.back();
      return CreateProjectResponseModel.fromJson(response.body);
    } else {
      return CreateProjectResponseModel(
          message: "Houve um erro na criação da publicação.");
    }
  }

  Future<UpdateProjectResponseModel> updateProject(
      UpdateProjectRequestModel model, token, String id) async {
    final response = await patch(projectsURL + id, model.toJson(), headers: {
      "Authorization": token!,
    });
    if (response.statusCode == HttpStatus.ok) {
      return UpdateProjectResponseModel.fromJson(response.body);
    } else {
      return UpdateProjectResponseModel(
          msg: "Houve um erro na atualização do projeto.");
    }
  }
  // Future<DeleteGetResearchProjectsResponse> deletePubService(token, id) async {
  //   final response = await delete(projectsURL + id, headers: {
  //     "Authorization": token!,
  //   });
  //   if (response.statusCode == HttpStatus.ok) {
  //     return DeleteGetResearchProjectsResponse.fromJson(
  //       response.body,
  //     );
  //   } else {
  //     return DeleteGetResearchProjectsResponse(
  //       msg: "Não foi possível excluir essa publicação.",
  //     );
  //   }
  // }
}
