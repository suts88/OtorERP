// app/javascript/controllers/search_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "select"]

  connect() {
    this.input = this.inputTarget;
    this.select = this.selectTarget;
  }

  search() {
    const query = this.input.value;
    const status = this.select.value;

    const turboFrame = document.getElementById("memo-list");


    let url = `/memos?query=${query}`;
    if (status) {
      url += `&status=${status}`;
    }

    turboFrame.src = url;
  }
}
