import FeatureController from './FeatureController'
import VoiceController from './VoiceController'
import UserController from './UserController'
import FeatureValueController from './FeatureValueController'
import VoiceFeatureValueController from './VoiceFeatureValueController'
import SampleController from './SampleController'
import ReviewController from './ReviewController'
import OrderController from './OrderController'
import PaymentController from './PaymentController'
import PostController from './PostController'

const Admin = {
    FeatureController: Object.assign(FeatureController, FeatureController),
    VoiceController: Object.assign(VoiceController, VoiceController),
    UserController: Object.assign(UserController, UserController),
    FeatureValueController: Object.assign(FeatureValueController, FeatureValueController),
    VoiceFeatureValueController: Object.assign(VoiceFeatureValueController, VoiceFeatureValueController),
    SampleController: Object.assign(SampleController, SampleController),
    ReviewController: Object.assign(ReviewController, ReviewController),
    OrderController: Object.assign(OrderController, OrderController),
    PaymentController: Object.assign(PaymentController, PaymentController),
    PostController: Object.assign(PostController, PostController),
}

export default Admin