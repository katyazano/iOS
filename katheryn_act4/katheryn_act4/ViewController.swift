//
//  ViewController.swift
//  katheryn_act4
//
//  Created by Alumno on 03/02/26.
//

import UIKit

// Estructura que representa una tarea
struct Task {
    var name: String
    var isCompleted: Bool
}

// Estructura que administra la lista de tareas
struct TaskList {
    private(set) var tasks: [Task] = []

    mutating func addTask(name: String) {
        let newTask = Task(name: name, isCompleted: false)
        tasks.append(newTask)
    }

    mutating func removeTask(at index: Int) {
        tasks.remove(at: index)
    }

    mutating func toggleTask(at index: Int) {
        tasks[index].isCompleted.toggle()
    }

    func count() -> Int {
        return tasks.count
    }

    func task(at index: Int) -> Task {
        return tasks[index]
    }
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

@IBOutlet weak var tableView: UITableView!
@IBOutlet weak var taskTextField: UITextField!

// Usamos el struct para manejar las tareas
var taskList = TaskList()

override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
}

@IBAction func addTask(_ sender: UIButton) {
    guard let text = taskTextField.text, !text.isEmpty else {
        return
    }

    taskList.addTask(name: text)
    taskTextField.text = ""
    tableView.reloadData()
}

// Número de filas
func tableView(_ tableView: UITableView,
                numberOfRowsInSection section: Int) -> Int {
    return taskList.count()
}

// Configuración de cada celda
func tableView(_ tableView: UITableView,
                cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    let task = taskList.task(at: indexPath.row)

    cell.textLabel?.text = task.name
    cell.accessoryType = task.isCompleted ? .checkmark : .none

    return cell
}

// Marcar tarea como completada
func tableView(_ tableView: UITableView,
                didSelectRowAt indexPath: IndexPath) {

    taskList.toggleTask(at: indexPath.row)
    tableView.reloadRows(at: [indexPath], with: .automatic)
}

// Eliminar tarea
func tableView(_ tableView: UITableView,
                commit editingStyle: UITableViewCell.EditingStyle,
                forRowAt indexPath: IndexPath) {

    if editingStyle == .delete {
        taskList.removeTask(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
