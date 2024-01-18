import { Controller } from "@hotwired/stimulus";

export class StripeController extends Controller {
  static values = { publicKey: String, clientSecret: String };
  stripe = Stripe(this.publicKeyValue);

  async connect() {
    console.log("Stimulus controller connected");
    console.log("Connect method is called");
    console.log("Public Key:", this.publicKeyValue);
    console.log("Client Secret:", this.clientSecretValue);

    this.checkout = await this.stripe.initEmbeddedCheckout({
      clientSecret: this.clientSecretValue,
    });

    console.log("Checkout Object:", this.checkout);

    this.checkout.mount(this.element);
  }

  disconnect() {
    this.checkout.destroy();
  }
}
