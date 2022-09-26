import { Controller } from "@hotwired/stimulus";
import { createPopper } from "@popperjs/core";

export default class extends Controller {
  static targets = ["button"];

  copy() {
    const shareUrl = `localhost:3000/share/${this.data.get("userItem")}`;
    navigator.clipboard.writeText(shareUrl);

    const tooltip = document.querySelector("#tooltip");
    //const button = document.querySelector("#share-button");

    console.log(tooltip);
    console.log(this.buttonTarget);
    //console.log(button);

    createPopper(this.buttonTarget, tooltip, {
      placement: "top",
    });
  }

  showmsg() {}
}
