public class KinectStates {

	SimpleOpenNI context;
	PVector headPos;
	PVector neckPos;
	PVector leftShoulderPos;
	PVector rightShoulderPos;
	PVector leftElbowPos;
	PVector rightElbowPos;
	PVector leftHandPos;
	PVector rightHandPos;
	PVector torsoPos;
	PVector leftHipPos;
	PVector rightHipPos;
	PVector leftKneePos;
	PVector rightKneePos;
	PVector leftFootPos;
	PVector rightFootPos;
	int states[][][];
	int currentState;
	String actions[];

	public KinectStates(SimpleOpenNI ctx) {
        context = ctx;
		headPos = new PVector();
		neckPos = new PVector();
		leftShoulderPos = new PVector();
		rightShoulderPos = new PVector();
		leftElbowPos = new PVector();
		rightElbowPos = new PVector();
		torsoPos = new PVector();
		leftHipPos = new PVector();
		rightHipPos = new PVector();
		leftHandPos = new PVector();
		rightHandPos = new PVector();
		leftKneePos = new PVector();
		rightKneePos = new PVector();
		leftFootPos = new PVector();
		rightFootPos = new PVector();
		int _states[][][] = {
			{	{1,0},	{3,0},	{5,0},	{7,0},	{9,0},	{11,0},	{0,0}	},
			{	{1,0},	{2,0},	{0,0},	{0,0},	{0,0},	{0,0},	{0,0}	},
			{	{2,0},	{2,0},	{0,2},	{0,2},	{0,2},	{0,2},	{0,2}	},
			{	{4,0},	{3,0},	{0,0},	{0,0},	{0,0},	{0,0},	{0,0}	},
			{	{4,0},	{4,0},	{0,1},	{0,1},	{0,1},	{0,1},	{0,1}	},
			{	{0,0},	{0,0},	{5,0},	{6,0},	{0,0},	{0,0},	{0,0}	},
			{	{0,2},	{0,2},	{6,0},	{6,0},	{0,2},	{0,2},	{0,2}	},
			{	{0,0},	{0,0},	{8,0},	{7,0},	{0,0},	{0,0},	{0,0}	},
			{	{0,1},	{0,1},	{8,0},	{8,0},	{0,1},	{0,1},	{0,1}	},
			{	{0,0},	{0,0},	{0,0},	{0,0},	{9,0},	{10,0},	{0,0}	},
			{	{0,4},	{0,4},	{0,4},	{0,4},	{0,4},	{10,0},	{0,4}	},
			{	{0,0},	{0,0},	{0,0},	{0,0},	{12,0},	{11,0},	{0,0}	},
			{	{0,3},	{0,3},	{0,3},	{0,3},	{12,0},	{12,0},	{0,3}	}
		};
		states = _states;
		currentState = 0;
		String _actions[] = { "", "LEFT", "RIGHT", "UP", "DOWN" };
		actions = _actions;
	}

	public String getCurrentAction() {
  
		// String data = "{"+"\"head\":["+headPos.x+","+headPos.y+","+headPos.z+"]"+"}";
		println("{"+
			"\"head\":["+headPos.x+","+headPos.y+","+headPos.z+"],"+
			"\"neck\":["+neckPos.x+","+neckPos.y+","+neckPos.z+"],"+
			"\"leftShoulder\":["+leftShoulderPos.x+","+leftShoulderPos.y+","+leftShoulderPos.z+"],"+
			"\"rightShoulder\":["+rightShoulderPos.x+","+rightShoulderPos.y+","+rightShoulderPos.z+"],"+
			"\"leftElbow\":["+leftElbowPos.x+","+leftElbowPos.y+","+leftElbowPos.z+"],"+
			"\"rightElbow\":["+rightElbowPos.x+","+rightElbowPos.y+","+rightElbowPos.z+"],"+
			"\"leftHand\":["+leftHandPos.x+","+leftHandPos.y+","+leftHandPos.z+"],"+
			"\"rightHand\":["+rightHandPos.x+","+rightHandPos.y+","+rightHandPos.z+"],"+
			"\"torso\":["+torsoPos.x+","+torsoPos.y+","+torsoPos.z+"],"+
			"\"leftHip\":["+leftHipPos.x+","+leftHipPos.y+","+leftHipPos.z+"],"+
			"\"rightHip\":["+rightHipPos.x+","+rightHipPos.y+","+rightHipPos.z+"],"+
			"\"leftKnee\":["+leftKneePos.x+","+leftKneePos.y+","+leftKneePos.z+"],"+
			"\"rightKnee\":["+rightKneePos.x+","+rightKneePos.y+","+rightKneePos.z+"],"+
			"\"leftFoot\":["+leftFootPos.x+","+leftFootPos.y+","+leftFootPos.z+"],"+
			"\"rightFoot\":["+rightFootPos.x+","+rightFootPos.y+","+rightFootPos.z+"]"+
		"}");
  
		int cState = getCurrentState();
		int action = states[currentState][cState][1];
		currentState = states[currentState][cState][0];
		return actions[action];
	}

	int getCurrentState () {

		int[] userList = context.getUsers();
		if( userList.length==0 || !context.isTrackingSkeleton(userList[0]) ){
			return 6;
		}
		int userId = userList[0];

		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_HEAD,headPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_NECK,neckPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_SHOULDER,leftShoulderPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_SHOULDER,rightShoulderPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_ELBOW,leftElbowPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_ELBOW,rightElbowPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND,leftHandPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HAND,rightHandPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_TORSO,torsoPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HIP,leftHipPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HIP,rightHipPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_KNEE,leftKneePos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_KNEE,rightKneePos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_FOOT,leftFootPos);
		context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_FOOT,rightFootPos);

		if( stateA() ) {
			return 0;
		} else if ( stateB() ) {
			return 1;
		} else if ( stateC() ) {
			return 2;
		} else if ( stateD() ) {
			return 3;
		} else if ( stateE() ) {
			return 4;
		} else if ( stateF() ) {
			return 5;
		}
		return 6;
	}

	Boolean stateA() {
		return ( leftHandPos.y>leftShoulderPos.y && leftHandPos.x<leftShoulderPos.x );
	}

	Boolean stateB() {
		return ( leftHandPos.y>leftShoulderPos.y && leftHandPos.x<neckPos.x && leftHandPos.x>leftShoulderPos.x );
	}

	Boolean stateC() {
		return ( rightHandPos.y>rightShoulderPos.y && rightHandPos.x<rightShoulderPos.x && rightHandPos.x>neckPos.x );
	}

	Boolean stateD() {
		return ( rightHandPos.y>rightShoulderPos.y && rightHandPos.x>rightShoulderPos.x );
	}

	Boolean stateE() {
		return (
			( leftHandPos.x>leftShoulderPos.x && leftHandPos.x<rightShoulderPos.x && leftHandPos.y<neckPos.y && leftHandPos.y>torsoPos.y ) ||
			( rightHandPos.x>leftShoulderPos.x && rightHandPos.x<rightShoulderPos.x && rightHandPos.y<neckPos.y && rightHandPos.y>torsoPos.y )
		);
	}
	Boolean stateF() {
		return (
			( leftHandPos.x>leftHipPos.x && leftHandPos.x<rightHipPos.x && leftHandPos.y<torsoPos.y && leftHandPos.y>leftHipPos.y ) ||
			( rightHandPos.x>leftHipPos.x && rightHandPos.x<rightHipPos.x && rightHandPos.y<torsoPos.y && rightHandPos.y>rightHipPos.y )
		);
	}

}
