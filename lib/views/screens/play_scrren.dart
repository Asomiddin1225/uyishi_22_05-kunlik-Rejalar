import 'package:flutter/material.dart';
import 'package:uyishi_22_05/controllers/play_controller.dart';
import 'package:uyishi_22_05/views/widgets/play_item.dart';

class PlanScreen extends StatefulWidget {
  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final PlanController _controller = PlanController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bugungi Rajalar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Yangi Reja...",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _controller.addPlan(_textController.text);
                      _textController.clear();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: _buildPlanLists(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPlanLists() {
    List<Widget> completedPlans = [];
    List<Widget> incompletePlans = [];

    for (int i = 0; i < _controller.plans.length; i++) {
      final plan = _controller.plans[i];
      final planItem = PlanItem(
        plan: plan,
        onUpdate: (title, completed) {
          setState(() {
            _controller.updatePlan(i, title, completed);
          });
        },
        onDelete: () {
          setState(() {
            _controller.deletePlan(i);
          });
        },
        onToggleCompletion: () {
          setState(() {
            _controller.toggleCompletion(i);
          });
        },
      );

      if (plan.completed) {
        completedPlans.add(planItem);
      } else {
        incompletePlans.add(planItem);
      }
    }


    

    return [
      if (incompletePlans.isNotEmpty) ...[
        Text("Bajarilmagan rejalar",
            style: TextStyle(fontSize: 18,
             fontWeight: FontWeight.bold
             )),
        ...incompletePlans,
        SizedBox(height: 20),
      ],
      if (completedPlans.isNotEmpty) ...[
        Text('Bajarilgan Rejalar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...completedPlans,
      ],
    ];
  }
}
