import { Application } from "@hotwired/stimulus";
import { StripeController } from "./stripe_controller.js";
console.log("This is application.js")
const application = Application.start();
application.register("stripe", StripeController);
application.debug = false;
window.Stimulus = application;

export { application };
