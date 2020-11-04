import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    id: root
    property bool active: true
    property real speed: 0.5
    property color color1: Qt.rgba(0.0, 0.5 ,1 ,1)
    property color color2: Qt.rgba(0.25, 0.25 ,1 ,1)
    Item
    {
        property int size: Math.min(parent.width,parent.height)
        property int circleWidth: size/10
        width: size
        height: size
        anchors.centerIn: parent
        Canvas
        {
            id: canvas1
            anchors.fill: parent
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.strokeStyle = root.color1
                ctx.lineWidth = parent.circleWidth
                ctx.beginPath();
                ctx.arc(parent.size/2, parent.size/2, parent.size/2-ctx.lineWidth, 0, 3.141592653);
                ctx.stroke();
            }
        }
        Canvas
        {
            id: canvas2
            anchors.fill: parent
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.strokeStyle = root.color2
                ctx.lineWidth = parent.circleWidth
                ctx.beginPath();
                ctx.arc(parent.size/2, parent.size/2, parent.size/2-2*ctx.lineWidth, 0, 3.141592653);
                ctx.stroke();
            }
        }
        RotationAnimator
        {
            target: canvas1
            from: 0
            to: 360
            duration: 1000/root.speed
            running: root.active
            loops: Animation.Infinite
        }
        RotationAnimator
        {
            target: canvas2
            from: 0
            to: 360
            duration: 600/root.speed
            running: root.active
            loops: Animation.Infinite
        }
    }
}