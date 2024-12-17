import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.amber.shade50, // Softer background for better contrast
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber.shade200,
                Colors.amber.shade400,
                Colors.amber.shade600,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurpleAccent.withOpacity(0.4),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Make AppBar transparent
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Todo List',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            elevation: 0, // Elevation is handled by the Container's shadow
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.amber.shade100,
            Colors.amber.shade200,
            Colors.amber.shade500,
            Colors.amber.shade600
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        )),
        child: BlocBuilder<TodoCubit, List<ToDo>>(
          builder: (context, todos) {
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 16), // Add spacing between cards
                  elevation: 4, // Add shadow for depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                  color:
                      Colors.amber.shade100, // Softer shade for better contrast
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16), // Spacing inside the tile
                    leading: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors
                          .amber.shade700, // Contrasting color for the avatar
                    ),
                    title: Text(
                      todo.name,
                      style: const TextStyle(
                        fontSize: 18, // Larger font size for better readability
                        fontWeight: FontWeight.w600, // Medium bold for emphasis
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      'Created on: ${todo.createdAt}', // Example subtitle with additional info
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54, // Subtle text color
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.amber, // Matches the theme
                      size: 20,
                    ),
                    tileColor: Colors.white, // Contrasting background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded ListTile corners
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Colors.amber.shade700, // Match the AppBar color for consistency
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28, // Slightly larger icon for better visual prominence
        ),
        elevation: 6, // Add shadow for a floating effect
        tooltip: 'Add Todo', // Tooltip for better user experience
      ),
    );
  }
}
