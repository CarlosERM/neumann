import 'package:get/get.dart';
import '../../components/form/description_input/description_input_controller.dart';
import '../../components/form/name_input/name_input_controller.dart';
import '../../participante_model.dart';
import '../research_projects_controller.dart';

class ResearchProjectController extends GetxController {
  late NameInputController nic;
  late DescriptionInputController dic;
  late ResearchProjectsController rpc;
  dynamic argument = Get.arguments;
  late String id;
  late String title;
  late String description;
  late List<Participante> members;

  @override
  void onInit() {
    nic = Get.put(
      NameInputController(),
    );
    dic = Get.put(DescriptionInputController());
    rpc = Get.put(ResearchProjectsController());
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
