import { Controller } from "@hotwired/stimulus";
import { createPopper } from "@popperjs/core";

export default class extends Controller {
  static targets = ["button"];

  copy() {
    const shareUrl = `https://personallibrary.fly.dev//share/${this.data.get(
      "userItem"
    )}`;
    navigator.clipboard.writeText(shareUrl);

    const tooltip = document.querySelector("#tooltip");

    createPopper(this.buttonTarget, tooltip, {
      placement: "top",
    });
    tooltip.classList.remove("hidden");
    setTimeout(() => {
      tooltip.classList.add("hidden");
    }, 2000);
  }
}
