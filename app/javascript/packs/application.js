

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./workout_details"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application.scss"
import "../stylesheets/application.css"
import "../stylesheets/footer.css"
import "../stylesheets/header.css"
import "../stylesheets/homes.css"
import "../stylesheets/likes.css"
import "../stylesheets/users.css"
import "../stylesheets/workouts.css"



Rails.start()
Turbolinks.start()
ActiveStorage.start()



