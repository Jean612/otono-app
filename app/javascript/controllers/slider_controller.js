import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["container", "left", "right"];

  connect() {
    this.leftTarget.addEventListener("click", () => {
      this.containerTarget.scrollLeft -= 250;
    });

    this.rightTarget.addEventListener("click", () => {
      this.containerTarget.scrollLeft += 250;
    });

    // let scrollInterval;

    // this.leftTarget.addEventListener("mousedown", () => {
    //   scrollInterval = setInterval(() => {
    //     this.containerTarget.scrollLeft -= 100;
    //   }, 25);
    // });

    // this.rightTarget.addEventListener("mousedown", () => {
    //   scrollInterval = setInterval(() => {
    //     this.containerTarget.scrollLeft += 100;
    //   }, 25);
    // });

    // this.leftTarget.addEventListener("mouseup", () => {
    //   clearInterval(scrollInterval);
    // });

    // this.rightTarget.addEventListener("mouseup", () => {
    //   clearInterval(scrollInterval);
    // });

    // this.leftTarget.addEventListener("mouseleave", () => {
    //   clearInterval(scrollInterval);
    // });

    // this.rightTarget.addEventListener("mouseleave", () => {
    //   clearInterval(scrollInterval);
    // });
  }
}
