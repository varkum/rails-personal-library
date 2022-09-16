import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "button"];

  open() {
    this.menuTarget.classList.toggle("hidden");
    let template = document.createElement("template");
    template.innerHTML =
      "<i class='fa-solid fa-xmark fa-xl' data-action='click->navbar#close' id='close-btn'></i>";

    document
      .querySelector("#open-btn")
      .replaceWith(template.content.firstChild);
  }

  close() {
    this.menuTarget.classList.toggle("hidden");
    let template = document.createElement("template");
    template.innerHTML =
      "<i class='fa-solid fa-bars fa-xl' data-action='click->navbar#open' id='open-btn'></i>";
    document
      .querySelector("#close-btn")
      .replaceWith(template.content.firstChild);
  }
}
