import QtQuick
import QtQuick.Layouts

import Quickshell

import qs.Commons
import qs.Widgets

import "./advanced"

ColumnLayout {
    id: root
    spacing: Style.marginM
    Layout.fillWidth: true


    /***************************
    * PROPERTIES
    ***************************/
    // Required properties
    required property var pluginApi

    required property string activeBackend
    required property bool   enabled
    required property string selectedMonitor

    // Monitor specific properties
    property string fillMode: pluginApi?.pluginSettings?.[selectedMonitor]?.fillMode    ?? pluginApi?.manifest?.metadata?.defaultSettings?.fill_mode ?? ""
    property int orientation: pluginApi?.pluginSettings?.[selectedMonitor]?.orientation ?? 0
    property string maxDepthFolder: pluginApi?.pluginSettings?.[selectedMonitor]?.maxDepthFolder ?? pluginApi?.manifest?.metadata?.defaultSettings?.max_depth_folder ?? "1"

    // Constants
    readonly property list<string> backends: ["qt6-multimedia", "mpvpaper"]

    // Signals
    signal saveMonitorProperty(key: string, value: var);
    signal saveGlobalProperty(key: string, value: var);


    /***************************
    * COMPONENTS
    ***************************/
    // Fill Mode
    NComboBox {
        enabled: root.enabled
        Layout.fillWidth: true
        label:       root.pluginApi?.tr("settings.advanced.fill_mode.label")
        description: root.pluginApi?.tr("settings.advanced.fill_mode.description")
        defaultValue: "fit"
        model: [
            {
                "key": "fit",
                "name": root.pluginApi?.tr("settings.advanced.fill_mode.fit")
            },
            {
                "key": "crop",
                "name": root.pluginApi?.tr("settings.advanced.fill_mode.crop")
            },
            {
                "key": "stretch",
                "name": root.pluginApi?.tr("settings.advanced.fill_mode.stretch")
            }
        ]
        currentKey: root.fillMode
        onSelected: key => root.fillMode = key
    }

    NComboBox {
        enabled: root.enabled
        Layout.fillWidth: true
        label:       root.pluginApi?.tr("settings.advanced.max_depth_folder.label")
        description: root.pluginApi?.tr("settings.advanced.max_depth_folder.description")
        defaultValue: "1"
        model: [
            {
                "key": "1",
                "name": root.pluginApi?.tr("settings.advanced.max_depth_folder.1")
            },
            {
                "key": "2",
                "name": root.pluginApi?.tr("settings.advanced.max_depth_folder.2")
            },
            {
                "key": "3",
                "name": root.pluginApi?.tr("settings.advanced.max_depth_folder.3")
            }
        ]
        currentKey: root.maxDepthFolder
        onSelected: key => root.maxDepthFolder = key
    }
    // Orientation
    NValueSlider {
        property real _value: root.orientation

        enabled: root.enabled
        from: 0
        to: 270
        value: root.orientation
        defaultValue: 0
        stepSize: 90
        text: _value
        label:       root.pluginApi?.tr("settings.advanced.orientation.label")
        description: root.pluginApi?.tr("settings.advanced.orientation.description")
        onMoved: value => _value = value
        onPressedChanged: (pressed, value) => {
            if(root.pluginApi == null) {
                Logger.e("video-wallpaper", "Plugin API is null.");
                return
            }

            if(!pressed) {
                root.saveMonitorProperty("orientation", _value);
                root.pluginApi.saveSettings();
            }
        }
    }

    NTabView {
        currentIndex: root.backends.indexOf(root.activeBackend)

        VideoWallpaper {
            id: videoWallpaper
            pluginApi: root.pluginApi
            enabled: root.enabled
        }

        Mpvpaper {
            id: mpvpaper
            pluginApi: root.pluginApi
            enabled: root.enabled
            selectedMonitor: root.selectedMonitor

            onSaveMonitorProperty: (key, value) => root.saveMonitorProperty(key, value);
        }

        NoBackend {
            pluginApi: root.pluginApi
            enabled: root.enabled
        }
    }

    Connections {
        target: root.pluginApi
        function onPluginSettingsChanged() {
            // Update the local properties on change
            root.fillMode =    root.pluginApi?.pluginSettings?.[root.selectedMonitor]?.fillMode    ?? root.pluginApi?.manifest?.metadata?.defaultSettings?.fillMode ?? ""
            root.orientation = root.pluginApi?.pluginSettings?.[root.selectedMonitor]?.orientation ?? 0
        }
    }


    /********************************
    * Save settings functionality
    ********************************/
    function saveSettings() {
        if(pluginApi == null) {
            Logger.e("mpvpaper", "Cannot save: pluginApi is null");
            return;
        }

        videoWallpaper.saveSettings();
        mpvpaper.saveSettings();

        saveGlobalProperty("maxDepthFolder", maxDepthFolder);
        saveMonitorProperty("fillMode", fillMode);
        saveMonitorProperty("orientation", orientation);
    }
}
