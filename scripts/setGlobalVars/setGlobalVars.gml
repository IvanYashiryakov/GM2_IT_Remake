function setGlobalVars() {
	// scr_setGlobalVars();

	globalvar Field;
	globalvar FWidth;
	FWidth = 6;
	globalvar FHeight;
	FHeight = 8;
	// 0 - Easy, 4-7 PCs
	// 1 - Medium, 8-11 PCs
	// 2 - Hard, 12-15 PCs
	globalvar GameDifficulty;
	GameDifficulty = 1;
	globalvar PCConnected;
	PCConnected = 0;
	globalvar WiresConnected;
	WiresConnected = 0;
	globalvar needReset;
	needReset = false;
	globalvar autoFillWires;
	autoFillWires = true;
	// GameType
	// 0 - Menu, 1 - Type1, 2 - Type2
	globalvar GameType;
	GameType = 0;

	enum item {
	    Empty = 10,
	    Block = 11,
	    Wire = 12,
	    PC = 13,
	    Server = 14,
	    PCWire = 15
	}




}
