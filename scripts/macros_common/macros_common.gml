//Beats
#macro POSITIVE		1
#macro NEGATIVE		-1
enum eBeat {	
	value, count, speed, amount, direction	};

//Directions and Angles
#macro NONE			0

#macro UP			1
#macro TOP			1
#macro RIGHT		2
#macro DOWN			3
#macro BOTTOM		3
#macro LEFT			4
#macro VERTICAL		5
#macro HORIZONTAL	6
#macro ANGLE_UP		0
#macro UP_RIGHT		7
#macro DOWN_RIGHT	8
#macro DOWN_LEFT	9
#macro UP_LEFT		10
#macro ANGLE_RIGHT 90
#macro ANGLE_DOWN 180
#macro ANGLE_LEFT 270
enum eDirection {	
	stop, up, right, down, left, forward, backward	};

//Button States
enum eButtonState { 
	disabled, enabled, mouseover, pressed, focus, detect, detectGUI	};

enum eSkillButtonState { 
	disabled, enabled, mouseover, pressed, disabled_energy, disabled_recharge, detect, detectGUI	};



