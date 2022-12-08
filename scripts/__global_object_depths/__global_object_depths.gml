function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // menu_parent
	global.__objectDepths[1] = 0; // obj_btn_BackToMenu
	global.__objectDepths[2] = 0; // obj_btn_DeleteExtra
	global.__objectDepths[3] = 0; // obj_btn_Difficulty
	global.__objectDepths[4] = 0; // obj_btn_LineUp
	global.__objectDepths[5] = 0; // obj_btn_Random
	global.__objectDepths[6] = 0; // obj_btn_Restart
	global.__objectDepths[7] = 0; // obj_btn_Start_02
	global.__objectDepths[8] = 0; // obj_btn_Start_01
	global.__objectDepths[9] = 0; // obj_btn_ON
	global.__objectDepths[10] = 0; // obj_Menu
	global.__objectDepths[11] = 0; // obj_Game
	global.__objectDepths[12] = 0; // obj_Game_02
	global.__objectDepths[13] = 0; // obj_item_parent
	global.__objectDepths[14] = -5; // obj_PC
	global.__objectDepths[15] = 0; // obj_PCWire
	global.__objectDepths[16] = 0; // obj_Restart
	global.__objectDepths[17] = -5; // obj_Server
	global.__objectDepths[18] = 0; // obj_Wire
	global.__objectDepths[19] = 0; // obj_Block
	global.__objectDepths[20] = 0; // obj_Screen
	global.__objectDepths[21] = 0; // obj_FirstRun


	global.__objectNames[0] = "menu_parent";
	global.__objectNames[1] = "obj_btn_BackToMenu";
	global.__objectNames[2] = "obj_btn_DeleteExtra";
	global.__objectNames[3] = "obj_btn_Difficulty";
	global.__objectNames[4] = "obj_btn_LineUp";
	global.__objectNames[5] = "obj_btn_Random";
	global.__objectNames[6] = "obj_btn_Restart";
	global.__objectNames[7] = "obj_btn_Start_02";
	global.__objectNames[8] = "obj_btn_Start_01";
	global.__objectNames[9] = "obj_btn_ON";
	global.__objectNames[10] = "obj_Menu";
	global.__objectNames[11] = "obj_Game";
	global.__objectNames[12] = "obj_Game_02";
	global.__objectNames[13] = "obj_item_parent";
	global.__objectNames[14] = "obj_PC";
	global.__objectNames[15] = "obj_PCWire";
	global.__objectNames[16] = "obj_Restart";
	global.__objectNames[17] = "obj_Server";
	global.__objectNames[18] = "obj_Wire";
	global.__objectNames[19] = "obj_Block";
	global.__objectNames[20] = "obj_Screen";
	global.__objectNames[21] = "obj_FirstRun";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
