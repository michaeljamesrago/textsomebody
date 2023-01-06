import { Controller } from '@hotwired/stimulus'
import { getParentController } from './stimulus_utils'
import Rails from '@rails/ujs'

export default class extends Controller {
  connect() {
    const parent = getParentController(this, 'smart-scroll')
    Rails.fire(parent.element, 'smart-scroll:added')
  }
}