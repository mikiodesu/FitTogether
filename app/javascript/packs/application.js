

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
import "../stylesheets/header.css"
import "../stylesheets/homes.css"
import "../stylesheets/likes.css"
import "../stylesheets/users.css"
import "../stylesheets/workouts.css"
import './calendar'; 
import '@fullcalendar/core/main.css';
import '@fullcalendar/daygrid/main.css';



Rails.start()
Turbolinks.start()
ActiveStorage.start()



