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
	}

	public String getCurrentAction() {
  
		String data = "{";
			data += "\"head\":["+headPos.x+","+headPos.y+","+headPos.z+"],";
			data += "\"neck\":["+neckPos.x+","+neckPos.y+","+neckPos.z+"],";
			data += "\"leftShoulder\":["+leftShoulderPos.x+","+leftShoulderPos.y+","+leftShoulderPos.z+"],";
			data += "\"rightShoulder\":["+rightShoulderPos.x+","+rightShoulderPos.y+","+rightShoulderPos.z+"],";
			data += "\"leftElbow\":["+leftElbowPos.x+","+leftElbowPos.y+","+leftElbowPos.z+"],";
			data += "\"rightElbow\":["+rightElbowPos.x+","+rightElbowPos.y+","+rightElbowPos.z+"],";
			data += "\"leftHand\":["+leftHandPos.x+","+leftHandPos.y+","+leftHandPos.z+"],";
			data += "\"rightHand\":["+rightHandPos.x+","+rightHandPos.y+","+rightHandPos.z+"],";
			data += "\"torso\":["+torsoPos.x+","+torsoPos.y+","+torsoPos.z+"],";
			data += "\"leftHip\":["+leftHipPos.x+","+leftHipPos.y+","+leftHipPos.z+"],";
			data += "\"rightHip\":["+rightHipPos.x+","+rightHipPos.y+","+rightHipPos.z+"],";
			data += "\"leftKnee\":["+leftKneePos.x+","+leftKneePos.y+","+leftKneePos.z+"],";
			data += "\"rightKnee\":["+rightKneePos.x+","+rightKneePos.y+","+rightKneePos.z+"],";
			data += "\"leftFoot\":["+leftFootPos.x+","+leftFootPos.y+","+leftFootPos.z+"],";
			data += "\"rightFoot\":["+rightFootPos.x+","+rightFootPos.y+","+rightFootPos.z+"]";
		data += "}";
		getCurrentState();
		return data;
	}

	void getCurrentState () {

		int[] userList = context.getUsers();
		if( userList.length==0 || !context.isTrackingSkeleton(userList[0]) ){
			return;
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

	}

}
