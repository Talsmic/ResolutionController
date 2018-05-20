///ppres_room_anchors([room]);
/// @arg [room] {RoomID}	(default: room)
/*
	[PPC][Module:Resolution]
	Checks for room specific resolution anchors
	>Returns {array} = [anchors_exist,anchor_x,anchor_y];
*/
var check_room = room; 
if ( argument_count > 0 ) { check_room = argument[0] };
var output;

switch ( check_room ) {
	
	default:					
		output[0] = false;	//No Anchors
		break;
		
	case rm_PPCPlayground:		
		output[0] = true;	//Found Anchors
		output[1] = 192; 	//X Anchor
		output[2] = 192;	//Y Anchor
		break;	
		
	};
	
return output;

/*=[Notes]======================================================================
	-	These anchors are useful for rooms where you want to expand the 
		resolution around a certain point, say the action happens in the middle 
		of the room	and as resolution increases you just want to increase the 
		view around that area.	
	-	Edit this script to add anchors for any rooms you need to, an example is 
		provided with rm_PPCPlayground.
	-	Comment out or delete the rm_PPCPlayground reference if you delete it.
