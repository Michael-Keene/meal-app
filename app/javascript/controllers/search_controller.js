import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ["query", "results"]

    search() {
        query.form.requestSubmit()
    }

    clear() {
        this.resultsTarget.remove()
    }

    get query() {
        return this.queryTarget.value
    }
}
