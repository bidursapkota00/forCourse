const addButton = document.getElementById('addButton');
const taskInput = document.getElementById('taskInput');
const taskList = document.getElementById('taskList');

let tasks = JSON.parse(localStorage.getItem('tasks')) || [];

addButton.addEventListener('click', addTask);

renderTasks();

function addTask() {
  const taskText = taskInput.value;
  if (taskText.trim() === '') return;

  const newTask = {
    id: Date.now(),
    text: taskText,
  };

  tasks.push(newTask);
  saveTasksToLocalStorage();

  taskInput.value = '';
  renderTasks();
}

function deleteTask(id) {
  tasks = tasks.filter((task) => task.id !== id);
  saveTasksToLocalStorage();
  renderTasks();
}

function renderTasks() {
  taskList.innerHTML = '';

  tasks.forEach((task) => {
    const taskItem = document.createElement('li');
    taskItem.innerHTML = `
      <span>${task.text}</span>
      <button class="editButton" onclick="editTask(${task.id})">Edit</button>
      <button class="deleteButton" onclick="deleteTask(${task.id})">Delete</button>
    `;
    taskList.appendChild(taskItem);
  });
}

function saveTasksToLocalStorage() {
  localStorage.setItem('tasks', JSON.stringify(tasks));
}

function editTask(id) {
  const task = tasks.find((task) => task.id === id);
  const newText = prompt('Edit task:', task.text);
  if (newText !== null && newText.trim() !== '') {
    task.text = newText;
    saveTasksToLocalStorage();
    renderTasks();
  }
}
