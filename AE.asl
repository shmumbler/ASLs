state("Apparatus Exanimus")
{
	double inGameTimer: "Apparatus Exanimus.exe", 0x05CF1840, 0x350, 0x20, 0x0, 0x3B0, 0x188, 0x10, 0x68, 0x20, 0x0, 0x20, 0x70;
}

isLoading
{
	return old.inGameTimer == current.inGameTimer;	//	Allows tracking IGT without reversion on deaths/loads.
}

start 
{
	if (current.inGameTimer > old.inGameTimer) 		//	Prevents timer starting if you reset during pause menu or loading screen. Probably obsolete with autorestart.
	{
		return current.inGameTimer > 0;				
	}
}

reset
{
	if (old.inGameTimer == 0) {						//	IGT becomes zero for a multi-frame window between loads.
		if (current.inGameTimer != 0) {				//	Target first frame IGT becomes non-zero.
			return current.inGameTimer < .1;		//	Reset if first non-zero value of IGT is "close enough" to zero.
		}
	}
}	
