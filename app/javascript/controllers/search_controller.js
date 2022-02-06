import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ["query"]

    search() {
        this.element.requestSubmit()
    }

    get query() {
        return this.queryTarget.value
    }
}
