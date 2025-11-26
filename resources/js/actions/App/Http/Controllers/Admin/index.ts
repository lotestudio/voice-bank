import FeatureController from './FeatureController'
import SampleController from './SampleController'
import VoiceController from './VoiceController'
import UserController from './UserController'
import FeatureValueController from './FeatureValueController'
import VoiceFeatureValueController from './VoiceFeatureValueController'
import ReviewController from './ReviewController'
import OrderController from './OrderController'
import PaymentController from './PaymentController'
import PostController from './PostController'
import SortController from './SortController'

const Admin = {
    FeatureController: Object.assign(FeatureController, FeatureController),
    SampleController: Object.assign(SampleController, SampleController),
    VoiceController: Object.assign(VoiceController, VoiceController),
    UserController: Object.assign(UserController, UserController),
    FeatureValueController: Object.assign(FeatureValueController, FeatureValueController),
    VoiceFeatureValueController: Object.assign(VoiceFeatureValueController, VoiceFeatureValueController),
    ReviewController: Object.assign(ReviewController, ReviewController),
    OrderController: Object.assign(OrderController, OrderController),
    PaymentController: Object.assign(PaymentController, PaymentController),
    PostController: Object.assign(PostController, PostController),
    SortController: Object.assign(SortController, SortController),
}

export default Admin