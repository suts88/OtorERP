// app/javascript/controllers/logout_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    logout(event) {
        event.preventDefault();

        fetch(this.element.href, {
            method: 'DELETE',
            headers: {
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                'Accept': 'text/html'
            }
        }).then(response => {
            if (response.ok) {
                window.location.href = '/';
            } else {
                console.log("Fehler bei der Logout-Antwort", response);
            }
        }).catch(error => {
            console.error("Logout-Fehler:", error);
        });
    }
}
