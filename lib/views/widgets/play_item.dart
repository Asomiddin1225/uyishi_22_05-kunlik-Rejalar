import 'package:flutter/material.dart';
import 'package:uyishi_22_05/models/play.dart';

class PlanItem extends StatelessWidget {
  final Plan plan;
  final void Function(String, bool) onUpdate;
  final VoidCallback onDelete;
  final VoidCallback onToggleCompletion;

  PlanItem({
    required this.plan,
    required this.onUpdate,
    required this.onDelete,
    required this.onToggleCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        leading: Checkbox(
          value: plan.completed,
          onChanged: (bool? value) {
            onToggleCompletion();
          },
        ),
        title: Text(
          plan.title,
          style: TextStyle(
            color: plan.completed ? Colors.green : Colors.red,
            decoration: plan.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditDialog(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final TextEditingController _editController =
        TextEditingController(text: plan.title);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Rejalarni O'zgartirish"),
          content: TextField(
            controller: _editController,
            decoration: InputDecoration(
              labelText: 'Reja nomi',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Bekor Qilish"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Saqlash'),
              onPressed: () {
                onUpdate(_editController.text, plan.completed);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
