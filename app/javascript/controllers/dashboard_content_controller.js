// app/javascript/controllers/dashboard_content_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        // Stellt sicher, dass "Overview" beim initialen Laden der Seite aktiv ist
        const initialTarget = document.querySelector("#overview");
        this.setActiveButton(initialTarget);
        this.loadContent({ target: initialTarget });

        // Dynamisches Setzen der Border-Klassen basierend auf der Bildschirmgröße
        this.updateBorders();
        window.addEventListener('resize', () => this.updateBorders());  // Reagiert auf Größenänderungen des Bildschirms
    }

    loadContent(event) {
        if (event && typeof event.preventDefault === 'function') {
            event.preventDefault();
        }
        const target = event.currentTarget || event.target;

        this.setActiveButton(target);

        // Holen des Turbo Frames
        const frame = document.querySelector("turbo-frame#main_content");
        const section = target.id;
        const url = `/dashboard/${section}`;

        // Fetch-Request an den Server, um das Partial zu laden
        fetch(url)
            .then(response => response.text())
            .then(html => {
                frame.innerHTML = html;
            })
            .catch(error => {
                frame.innerHTML = "<h2>Error loading content</h2>";
                console.error("Error loading content:", error);
            });
    }

    setActiveButton(target) {
        // Entfernt die aktiven Klassen von allen Buttons und deren Icons
        document.querySelectorAll(".nav-link").forEach(button => {
            button.classList.remove("bg-white-gray", "text-accent-blue", "border-l-4", "border-t-4", "border-light-blue");
            button.classList.add("bg-white", "text-text-gray", "border-white");

            // Entferne auch die Klassen von den Icons innerhalb jedes Buttons
            button.querySelectorAll(".nav-icon").forEach(icon => {
                icon.classList.remove("text-accent-blue");
                icon.classList.add("text-text-black");
            });
        });

        // Fügt die aktiven Klassen für den geklickten Button hinzu
        target.classList.remove("bg-white", "text-text-gray", "border-white");
        target.classList.add("bg-white-gray", "text-accent-blue", "border-light-blue");

        // Aktualisiert das Icon im geklickten Button
        target.querySelectorAll(".nav-icon").forEach(icon => {
            icon.classList.remove("text-text-black");
            icon.classList.add("text-accent-blue");
        });

        // Dynamisches Setzen der Border basierend auf der Bildschirmgröße
        this.updateBorders();
    }

    updateBorders() {
        // Bestimmt die Bildschirmbreite
        const isMediumScreen = window.matchMedia("(min-width: 768px)").matches;

        document.querySelectorAll(".nav-link").forEach(button => {
            button.classList.remove("border-l-4", "border-t-4");

            if (isMediumScreen) {
                // Für Bildschirme ab 768px (md) - linke Border
                button.classList.add("border-l-4");
            } else {
                // Für kleinere Bildschirme - obere Border
                button.classList.add("border-t-4");
            }
        });
    }
}
