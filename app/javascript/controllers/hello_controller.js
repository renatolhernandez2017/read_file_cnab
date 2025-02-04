import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello Controller conectado!");
  }

  sayHello() {
    alert("Olá do Hello Controller!");
  }

  togglePassword() {
    const passwordField = this.element.querySelector('#hash_link');
    const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordField.setAttribute('type', type);
    this.element.querySelector('#toggle-password').textContent = type === 'password' ? 'visibility_off' : 'visibility';
  }

  toggleTableTr(id) {
    const trId = id.currentTarget.dataset.trId;
    const hiddenRow = document.getElementById(trId);

    if (hiddenRow) {
      hiddenRow.classList.toggle('hidden');
    }
  }
}
