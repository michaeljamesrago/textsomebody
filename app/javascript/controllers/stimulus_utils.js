export function getParentController(controller, identifier) {
  const application = controller.application
  let element = controller.element
  do {
    let foundController =
      application.getControllerForElementAndIdentifier(element, identifier)
    if (foundController) {
      return foundController
    }
  } while (element = element.parentElement)
}