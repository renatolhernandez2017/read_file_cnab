import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello Controller conectado!");
  }

  sayHello() {
    alert("Olá do Hello Controller!");
  }
}
