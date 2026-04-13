import QtQuick
import QtQuick.Controls

Page {
    id: lobby
    title: "Lobby Page"
    Rectangle {
        width: 700; height: 700
        color: "#286d26"
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#286d26";
            }
            GradientStop {
                position: 0.20;
                color: "#ffffff";
            }
            GradientStop {
                position: 1.00;
                color: "#ffffff";
            }
        }

    }
}
