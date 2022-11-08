import { Controller } from "@hotwired/stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [
    "showBoltsLink",
    "hideBoltsLink",
    "boltsAndSmallCutsContainer",
  ];

  static values = {
    sku: String,
  };

  connect() {
    this.reload();
  }

  toggleBoltList(hidden) {
    this.showBoltsLinkTarget.classList.toggle("hidden", hidden);
    this.hideBoltsLinkTarget.classList.toggle("hidden", !hidden);
    this.boltsAndSmallCutsContainerTarget.classList.toggle("hidden", !hidden);
  }

  showBoltList() {
    this.toggleBoltList(true);
  }

  hideBoltList() {
    this.toggleBoltList(false);
  }

  reload() {
    this.element.classList.add("opacity-50");
    Rails.ajax({
      url: `/api/stock_and_pricing?sku=${this.skuValue}`,
      type: "GET",
      dataType: "script",
      complete: () => {
        this.element.classList.remove("opacity-50");
      },
    });
  }
}
