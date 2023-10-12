import jquery from "jquery";
window.$ = jquery;

import "@fortawesome/fontawesome-free";
import "@nathanvda/cocoon";
import "@hotwired/turbo-rails";
import SortableController from "controllers/sortable_controller";
import { Application } from "@hotwired/stimulus";

const application = Application.start();
application.register('sortable', SortableController); 

$(function() {
  console.log("Hello Rails7!");
});
