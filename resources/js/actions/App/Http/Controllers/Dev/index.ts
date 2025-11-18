import TemplateController from './TemplateController'
import ServicePagesController from './ServicePagesController'
import DataListTestController from './DataListTestController'

const Dev = {
    TemplateController: Object.assign(TemplateController, TemplateController),
    ServicePagesController: Object.assign(ServicePagesController, ServicePagesController),
    DataListTestController: Object.assign(DataListTestController, DataListTestController),
}

export default Dev