import { Controller } from "@hotwired/stimulus";
import Sortable from 'sortablejs';
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  static values = {
    group: String
  }

  connect() {
    console.log("Connected to Sortable!");
    this.initializeSortable();
  }

  initializeSortable() {
    if (this.sortable) {
      this.sortable.destroy();
    }

    this.sortable = Sortable.create(this.element, {
      onStart: this.onStart.bind(this),
      onChange: this.onChange.bind(this),
      onEnd: this.onEnd.bind(this),
      group: this.groupValue,
    });
  }

  onStart(event) {
    console.log("スタート");
  }

  onChange(event) {
    console.log("場所移動しました。");
  }

  onEnd(event) {
    console.log("Sortable onEnd triggered!");
    console.log("Board ID from dataset:", this.element.dataset.boardId);

    let taskId = event.item.dataset.id;
    let newPosition = event.newIndex;

    const request = new FetchRequest("PATCH", `/boards/${this.element.dataset.boardId}/update_task_order`, {
      body: JSON.stringify({
        task_id: taskId,
        position: newPosition
      }),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    });

    request.perform()
      .then(response => {
        if(response.ok) {
          console.log(response)
          return response.json();
        } else {
          throw new Error("Server error");
        }
      })
      .then(data => {
        console.log(data.message);
        this.initializeSortable();
      })
      .catch(error => {
        console.error("Error:", error);
      });
  }
}
