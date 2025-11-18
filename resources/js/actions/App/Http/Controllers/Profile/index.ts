import ProfileSettingsController from './ProfileSettingsController'
import OrdersController from './OrdersController'
import ReviewsController from './ReviewsController'
import FavoritesController from './FavoritesController'

const Profile = {
    ProfileSettingsController: Object.assign(ProfileSettingsController, ProfileSettingsController),
    OrdersController: Object.assign(OrdersController, OrdersController),
    ReviewsController: Object.assign(ReviewsController, ReviewsController),
    FavoritesController: Object.assign(FavoritesController, FavoritesController),
}

export default Profile