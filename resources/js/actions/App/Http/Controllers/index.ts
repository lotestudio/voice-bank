import UI from './UI'
import MainController from './MainController'
import VoicesController from './VoicesController'
import SampleDownloaderController from './SampleDownloaderController'
import Admin from './Admin'
import Dev from './Dev'
import Settings from './Settings'
import Auth from './Auth'

const Controllers = {
    UI: Object.assign(UI, UI),
    MainController: Object.assign(MainController, MainController),
    VoicesController: Object.assign(VoicesController, VoicesController),
    SampleDownloaderController: Object.assign(SampleDownloaderController, SampleDownloaderController),
    Admin: Object.assign(Admin, Admin),
    Dev: Object.assign(Dev, Dev),
    Settings: Object.assign(Settings, Settings),
    Auth: Object.assign(Auth, Auth),
}

export default Controllers