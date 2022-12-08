event_inherited();
itemType = item.Wire;
// в какую сторону от сервера был создан провод
// 0 - Left, 1 - Up, 2 - Right, 3 - Down
dirFromSrv = -1

// true если провод используется для соединения более одного компа с сервером
usedTwice = false;

// можно ли поворачивать провод
freeze = false;

// идет ли провод от сервера
fromServer = false;

// концы провода      // 0 - Left, 1 - Up, 2 - Right, 3 - Down
// если = false, то на этой стороне нет конца провода
w[LEFT] = true;
w[UP] = false;
w[RIGHT] = false;
w[DOWN] = false;

clockwiseRotation = true;

selfPC = -1;

rMousePressed = false;
lMousePressed = false;
canMove = false;


