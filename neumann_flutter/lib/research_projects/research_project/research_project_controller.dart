import 'package:get/get.dart';

import '../../components/form/description_input/description_input_controller.dart';
import '../../components/form/name_input/name_input_controller.dart';
import '../get_research_projects_response.dart';
import '../research_projects_controller.dart';

class ResearchProjectController extends GetxController {
  final NameInputController nic = Get.put(
    NameInputController(),
  );
  DescriptionInputController dic = Get.put(DescriptionInputController());
  ResearchProjectsController rpc = Get.put(ResearchProjectsController());

  dynamic argument = Get.arguments;
  late String id;
  late String title;
  late String description;
  late List<Participante> members;
  @override
  void onInit() {
    id = argument[0]['id'];
    title = argument[1]['title'];
    description = argument[2]['description'];
    members = argument[3]['members'];
    super.onInit();
  }

  void sendDataToEdit() {
    nic.nameController.text = title;
    dic.descriptionController.text = description;
    rpc.projectId = id;
  }
}
