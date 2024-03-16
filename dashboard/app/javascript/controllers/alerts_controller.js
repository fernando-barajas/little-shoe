import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="alerts"
export default class extends Controller {
  close(e) {
    e.target.closest(".alert").remove();
  }
}
