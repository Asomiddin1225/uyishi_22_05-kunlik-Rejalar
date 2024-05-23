import 'package:uyishi_22_05/models/play.dart';

class PlanController {
  List<Plan> plans = [
    Plan(title: "05:30  Uyqudan uyg'onish"),
    Plan(title: "07:00  Nonushta"),
    Plan(title: "08:00 Maktabda bo'lis"),
  ];

  void addPlan(String title) {
    plans.add(Plan(title: title));
  }

  void updatePlan(int index, String title, bool completed) {
    plans[index].title = title;
    plans[index].completed = completed;
  }

  void toggleCompletion(int index) {
    plans[index].completed = !plans[index].completed;
  }

  void deletePlan(int index) {
    plans.removeAt(index);
  }
}
