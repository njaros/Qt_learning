import QtQuick
import Counter

Item {

    property int counterValue: 0
    Rectangle {
        id: page
        anchors.fill: parent
        color: "#ffffff"
        states: [
            State {
                name: "State1"

                PropertyChanges {
                    target: icon
                    x: topLeftRect.x
                    y: topLeftRect.y
                }
            },
            State {
                name: "State2"

                PropertyChanges {
                    target: icon
                    x: middleRightRect.x
                    y: middleRightRect.y
                }
            },
            State {
                name: "State3"

                PropertyChanges {
                    target: icon
                    x: bottomLeftRect.x
                    y: bottomLeftRect.y
                }
            }
        ]
        transitions: [
            Transition {
                from: "State2,State3"
                to: "State1"
                id: toState1
                ParallelAnimation {

                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: icon
                        property: "y"
                        duration: 200
                    }
                }

                SequentialAnimation {

                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: icon
                        property: "x"
                        duration: 200
                    }
                }
            },
            Transition {
                id: toState2
                ParallelAnimation {
                    SequentialAnimation {
                        PauseAnimation {
                            duration: 0
                        }

                        PropertyAnimation {
                            target: icon
                            property: "y"
                            easing.type: Easing.OutBounce
                            duration: 1006
                        }
                    }

                    SequentialAnimation {
                        PauseAnimation {
                            duration: 0
                        }

                        PropertyAnimation {
                            target: icon
                            property: "x"
                            easing.type: Easing.OutBounce
                            duration: 1006
                        }
                    }
                }
                to: "State2"
                from: "State1,State3"
            },
            Transition {
                id: toState3
                ParallelAnimation {
                    SequentialAnimation {
                        PauseAnimation {
                            duration: 0
                        }

                        PropertyAnimation {
                            target: icon
                            property: "y"
                            easing.type: Easing.InOutQuad
                            duration: 2000
                        }
                    }

                    SequentialAnimation {
                        PauseAnimation {
                            duration: 0
                        }

                        PropertyAnimation {
                            target: icon
                            property: "x"
                            easing.type: Easing.InOutQuad
                            duration: 2000
                        }
                    }
                }
                to: "State3"
                from: "State1,State2"
            }
        ]
    }
    Counter {
        id: counter
        onCounterIncremeted: () => {
            counterValue = get_counter()
        }
    }
    Image {
        id: icon
        fillMode: Image.PreserveAspectFit
        x: 20
        y: 20
        source: "brain.png"
        transform: [
            Scale {
                xScale: 55/1005
                yScale: 41/881
            }
        ]
    }

    Rectangle {
        id: counterRect
        width: 50
        height: 50
        color: "WHITE"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: textCounter
            anchors.centerIn: parent
            text: counterValue
            font.pixelSize: 32
        }
    }

    Rectangle {
        id: topLeftRect
        width: 55
        height: 41
        color: "#00ffffff"
        border.color: "#808080"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
        Connections {
            target: mouseArea1
            function onClicked()
            {
                page.state = "State1"
                counter.incr()
            }
        }
    }
    Rectangle {
        id: middleRightRect
        width: 55
        height: 41
        color: "#00ffffff"
        border.color: "#808080"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 20
        MouseArea {
            id: mouseArea2
            anchors.fill: parent

            Connections {
                target: mouseArea2
                function onClicked()
                {
                    page.state = "State2"
                    counter.incr()
                }
            }
        }
    }
    Rectangle {
        id: bottomLeftRect
        width: 55
        height: 41
        color: "#00ffffff"
        border.color: "#808080"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        MouseArea {
            id: mouseArea3
            anchors.fill: parent

            Connections {
                target: mouseArea3
                function onClicked()
                {
                    page.state = "State3"
                    counter.incr()
                }
            }
        }
    }
}