import { Controller } from "@hotwired/stimulus";
import Sortable from 'sortablejs';

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = {
    group: String
  }

  connect() {
    console.log("Connected to Sortable!");
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: this.groupValue,
    });
  }

  onEnd(event) {
    console.log("Sortable onEnd triggered!");
    var sortableUpdateUrl = event.item.dataset.sortableUpdateUrl;
    var sortableListId = event.to.dataset.sortableListId;
  }
}