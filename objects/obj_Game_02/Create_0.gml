//setGlobalVars();
var pc_array;
autoFillWires = false;
createField();
resetGame();

with (obj_Wire)   {
    randomize();
    moveItem(irandom(FWidth), irandom(FHeight), self.id);
}
with (obj_PCWire)   {
    randomize();
    moveItem(irandom(FWidth), irandom(FHeight), self.id);
}

