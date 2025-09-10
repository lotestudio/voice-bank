import VoiceController from './VoiceController'
import UserController from './UserController'
import FeatureController from './FeatureController'
import FeatureValueController from './FeatureValueController'
import SampleController from './SampleController'
import ReviewController from './ReviewController'
import OrderController from './OrderController'
import PaymentController from './PaymentController'
import TemplateController from './TemplateController'

const Admin = {
    VoiceController: Object.assign(VoiceController, VoiceController),
    UserController: Object.assign(UserController, UserController),
    FeatureController: Object.assign(FeatureController, FeatureController),
    FeatureValueController: Object.assign(FeatureValueController, FeatureValueController),
    SampleController: Object.assign(SampleController, SampleController),
    ReviewController: Object.assign(ReviewController, ReviewController),
    OrderController: Object.assign(OrderController, OrderController),
    PaymentController: Object.assign(PaymentController, PaymentController),
    TemplateController: Object.assign(TemplateController, TemplateController),
}

export default Admin