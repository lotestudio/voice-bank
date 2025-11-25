import Admin from './Admin'
import UI from './UI'
import MainController from './MainController'
import VoicesController from './VoicesController'
import ArtistController from './ArtistController'
import Profile from './Profile'
import SampleDownloaderController from './SampleDownloaderController'
import Auth from './Auth'
import Dev from './Dev'
import Settings from './Settings'

const Controllers = {
    Admin: Object.assign(Admin, Admin),
    UI: Object.assign(UI, UI),
    MainController: Object.assign(MainController, MainController),
    VoicesController: Object.assign(VoicesController, VoicesController),
    ArtistController: Object.assign(ArtistController, ArtistController),
    Profile: Object.assign(Profile, Profile),
    SampleDownloaderController: Object.assign(SampleDownloaderController, SampleDownloaderController),
    Auth: Object.assign(Auth, Auth),
    Dev: Object.assign(Dev, Dev),
    Settings: Object.assign(Settings, Settings),
}

export default Controllers