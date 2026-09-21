import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: settingsWindow
    title: "CPack settings"
    width: 360
    height: 500
    modality: Qt.ApplicationModal

    ScrollView {
            anchors.fill: parent
            anchors.margins: 12
            contentWidth: availableWidth
            ScrollBar.vertical.policy: ScrollBar.AsNeeded

            ColumnLayout {
                width: parent.width
                spacing: 16

                TextField { placeholderText: "Package Name"; Layout.fillWidth: true }
                TextField { placeholderText: "Package Vendor"; Layout.fillWidth: true }
                TextArea {
                    id: myTextArea
                    Layout.fillWidth: true
                    placeholderText: "Package description..."
                    wrapMode: Text.WordWrap
                    padding: 8
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    TextField {
                        id: descriptionFile
                        placeholderText: "Path to description file..."
                        Layout.fillWidth: true
                        readOnly: true
                    }

                    Button {
                        text: "browse..."
                        onClicked: fileDialog.open()
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    TextField {
                        id: welcomeResourceFile
                        placeholderText: "Path to welcome resource file..."
                        Layout.fillWidth: true
                        readOnly: true
                    }

                    Button {
                        text: "browse..."
                        onClicked: fileDialog.open()
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    TextField {
                        id: licenseFile
                        placeholderText: "Path to license file..."
                        Layout.fillWidth: true
                        readOnly: true
                    }

                    Button {
                        text: "browse..."
                        onClicked: fileDialog.open()
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    TextField {
                        id: readmeFile
                        placeholderText: "Path to readme file..."
                        Layout.fillWidth: true
                        readOnly: true
                    }

                    Button {
                        text: "browse..."
                        onClicked: fileDialog.open()
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }

                GroupBox{
                    title: "packaging type"
                    Layout.fillWidth: true

                    ColumnLayout{
                        spacing: -10
                        Layout.fillWidth: true

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 6

                            CheckBox {
                                id: checkArchive
                                text: "Archive"
                            }

                            RowLayout {
                                visible: checkArchive.checked
                                Layout.leftMargin: 28
                                spacing: 6

                                Text {
                                    text: ">"
                                    font.pixelSize: 14
                                    rotation: archiveDetails.expanded ? 90 : 0
                                    Behavior on rotation { NumberAnimation { duration: 150 } }
                                }

                                Label {
                                    text: "advanced settings"
                                    font.pixelSize: 12
                                    font.underline: hoverArchive.hovered
                                    color: hoverArchive.hovered ? "#0066cc" : "#555555"
                                }

                                HoverHandler { id: hoverArchive; cursorShape: Qt.PointingHandCursor }
                                TapHandler { onTapped: archiveDetails.expanded = !archiveDetails.expanded }
                            }

                            ColumnLayout {
                                id: archiveDetails
                                property bool expanded: false

                                visible: checkArchive.checked && expanded
                                Layout.fillWidth: true
                                Layout.leftMargin: 40
                                spacing: 6

                                CheckBox { text: "ZIP format"; checked: true }
                                CheckBox { text: "TGZ format"; checked: true }
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 6

                            CheckBox {
                                id: checkDeb
                                text: "DEB Package"
                            }

                            RowLayout {
                                visible: checkDeb.checked
                                Layout.leftMargin: 28
                                spacing: 6

                                Text {
                                    text: ">"
                                    font.pixelSize: 14
                                    rotation: debDetails.expanded ? 90 : 0
                                    Behavior on rotation { NumberAnimation { duration: 150 } }
                                }

                                Label {
                                    text: "advanced settings"
                                    font.pixelSize: 12
                                    font.underline: hoverDeb.hovered
                                    color: hoverDeb.hovered ? "#0066cc" : "#555555"
                                }

                                HoverHandler { id: hoverDeb; cursorShape: Qt.PointingHandCursor }
                                TapHandler { onTapped: debDetails.expanded = !debDetails.expanded }
                            }

                            ColumnLayout {
                                id: debDetails
                                property bool expanded: false

                                visible: checkDeb.checked && expanded
                                Layout.fillWidth: true
                                Layout.leftMargin: 40
                                spacing: 6

                                TextField { placeholderText: "Package Maintainer"; Layout.fillWidth: true }
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 6

                            CheckBox {
                                id: checkIfw
                                text: "IFW (Qt Installer Framework)"
                            }

                            RowLayout {
                                visible: checkIfw.checked
                                Layout.leftMargin: 28
                                Layout.fillWidth: true
                                spacing: 6

                                Text {
                                    text: ">"
                                    font.pixelSize: 14
                                    rotation: ifwDetails.expanded ? 90 : 0
                                    Behavior on rotation { NumberAnimation { duration: 150 } }
                                }

                                Label {
                                    text: "advanced settings"
                                    font.pixelSize: 12
                                    font.underline: hoverIfw.hovered
                                    color: hoverIfw.hovered ? "#0066cc" : "#555555"
                                }

                                HoverHandler { id: hoverIfw; cursorShape: Qt.PointingHandCursor }
                                TapHandler { onTapped: ifwDetails.expanded = !ifwDetails.expanded }
                            }

                            ColumnLayout {
                                id: ifwDetails
                                property bool expanded: false

                                visible: checkIfw.checked && expanded

                                Layout.fillWidth: true
                                Layout.leftMargin: 40
                                Layout.rightMargin: 0
                                spacing: 6

                                TextField {
                                    placeholderText: "Installer Title"
                                    Layout.fillWidth: true
                                }

                                TextField {
                                    placeholderText: "Target Directory"
                                    Layout.fillWidth: true
                                }
                            }
                        }
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }
}
