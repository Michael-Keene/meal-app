import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ["query", "results"]

    search() {
        query.form.requestSubmit()
    }

    clear() {
        requestAnimationFrame(() => {
            if(!this.element.contains(document.activeElement)) {
                this.resultsTarget.remove()
            }
        });
    }

    clear_form(event) {
        event.originalTarget.form.requestSubmit()
        event.originalTarget.form.parentElement.remove()
    }

    get query() {
        return this.queryTarget.value
    }
}
