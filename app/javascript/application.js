import { Turbo } from "@hotwired/turbo-rails";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import "controllers"; // This loads all your controllers
import Rails from '@rails/ujs';
Rails.start();

import "fullcalendar/main.css"; // Make sure to import the CSS here
