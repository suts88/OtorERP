import { Application } from "@hotwired/stimulus"
import DashboardContentController from
        "./dashboard_content_controller"
import DropdownController from "./dropdown_controller";
import LogoutController from "./logout_controller";
import PagingUpdateController from "./paging_update_controller";
import SearchController from "./search_controller";
const application = Application.start()
application.register("dashboard_content", DashboardContentController)
application.register("dropdown", DropdownController)
application.register("logout", LogoutController)
application.register("pagingUpdate", PagingUpdateController);
application.register("search", SearchController);
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
