// app/javascript/controllers/application.js
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

// Stimulus Application Setup
const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

// Expose Stimulus globally for debugging or additional setup if needed
window.Stimulus = application

export { application }
