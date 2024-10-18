// app/javascript/controllers/paging_update_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Paging Update Controller connected");
  }

  update() {
    this.element.requestSubmit();
  }
}
