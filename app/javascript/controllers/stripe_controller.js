import { Controller } from "@hotwired/stimulus";

export class StripeController extends Controller {
  static values = { publicKey: String, clientSecret: String };

  async connect() {
    console.log("Stimulus controller connected");
    console.log("Connect method is called");
    console.log("Public Key:", this.publicKeyValue);
    console.log("Client Secret:", this.clientSecretValue);

    try {
      const stripe = Stripe(this.publicKeyValue);

      this.checkout = await stripe.initEmbeddedCheckout({
        clientSecret: this.clientSecretValue,
      });

      console.log("Checkout Object:", this.checkout);

      this.checkout.mount(this.element);
    } catch (error) {
      console.error("Error initializing Stripe:", error);
    }
  }

  disconnect() {
    if (this.checkout) {
      this.checkout.destroy();
    }
  }
}
