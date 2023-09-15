import jquery from "jquery";
window.$ = jquery;

import "@fortawesome/fontawesome-free";
import "@nathanvda/cocoon";
import "@hotwired/turbo-rails";
import "controllers/sortable_controller";

import { Application } from "stimulus";
import SortableController from "controllers/sortable_controller";

const application = Application.start();
application.register('sortable', SortableController); 

$(function() {
  console.log("Hello Rails7!");
});

application.debug = false;
window.Stimulus = application;

export { application };
