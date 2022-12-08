event_inherited();
itemType = item.Server;
image_speed = 0.01;
isON = true;

// количество проводов из Server
portsCount = 0;

// нужен для поворота проводов если portsCount = 2
lastPort = 0;

w[LEFT] = false;
w[UP] = false;
w[RIGHT] = false;
w[DOWN] = false;

randomize();
if (portsCount <= 0) {
    portsCount = 1 + irandom(2);
} else if (portsCount > 3) {
    portsCount = 3;
}
var _wDir = irandom(3);
w[_wDir] = true;
lastPort = _wDir;
if (portsCount == 2) {
    if (irandom(1) == 0) {
        _wDir = correctDir(_wDir+1);
    } else {
        _wDir = correctDir(_wDir-1);
        lastPort = _wDir;
    }
    w[_wDir] = true;
} else if (portsCount > 2) {
    for (var i = 0; i < portsCount - 1; i++) {
        _wDir = correctDir(_wDir+1);
        w[_wDir] = true;
    }
}

lMousePressed = false;
canMove = false;
freeze = false;


