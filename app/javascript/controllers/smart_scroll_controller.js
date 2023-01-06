import { Controller } from '@hotwired/stimulus'
import Rails from '@rails/ujs'

const observer = new ResizeObserver(entries => {
  for (let entry of entries) {
    Rails.fire(entry.target, 'resize')
  }
})

export default class extends Controller {
  connect() {
    observer.observe(this.element)
    this.shouldScroll = true
    this.scrollToBottom()
  }

  disconnect() {
    observer.unobserve(this.element)
  }

  scrollToBottom() {
    const { scrollHeight, clientHeight, offsetHeight } = this.element
    if (scrollHeight >= clientHeight) {
      this.element.scrollTop = scrollHeight - clientHeight
    }
  }

  handleAdded() {
    // const { scrollHeight, clientHeight } = this.element
    // if (clientHeight >= scrollHeight) {
    //   this.shouldScroll = true
    // }
    // if (this.shouldScroll) {
    //   this.scrollToBottom()
    // }
    this.scrollToBottom()
  }

  handleScroll() {
    const { scrollTop, scrollHeight, clientHeight, offsetHeight } = this.element
    if (clientHeight >= scrollHeight) {
      this.shouldScroll = true
    } else {
      this.shouldScroll =
        Math.abs((scrollTop + offsetHeight) - scrollHeight) < 1
    }
  }
}