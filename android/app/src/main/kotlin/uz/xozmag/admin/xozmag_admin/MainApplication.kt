package uz.xozmag.admin.xozmag_admin

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()

//        MapKitFactory.setLocale("ru")
        MapKitFactory.setApiKey("030bade6-8cc8-4c10-9551-c6b3b7026672")
    }
}