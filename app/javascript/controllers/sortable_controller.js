import { Controller } from "@hotwired/stimulus";
import Sortable from 'sortablejs';
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  static values = {
    group: String
  }

  connect() {
    this.initializeSortable();
  }

  initializeSortable() {
    if (this.sortable) {
      this.sortable.destroy();
    }

    this.sortable = Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: this.groupValue,
    });
  }

  onEnd(event) {
    console.log(event)
    const updatedTasks = Array.from(event.from.children).map((taskElement, index) => {
      return {
        id: parseInt(taskElement.dataset.taskId, 10),
        position: index + 1
      };
    });
    console.log(updatedTasks)

    const request = new FetchRequest("PATCH", `/boards/${this.element.dataset.boardId}/update_task_order`, {
      body: JSON.stringify({
        tasks: updatedTasks
      }),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    });

    request.perform()
      .then(response => {
        if(response.ok) {
          return response.responseJson;
        } else {
          throw new Error("Server error");
        }
      })
      .then(data => {
        this.initializeSortable();
      })
      .catch(error => {
        console.error("Error:", error);
      });
  }
}