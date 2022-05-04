import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "styles/frontend"
import "bootstrap";

Rails.start()
Turbolinks.start()
ActiveStorage.start()
