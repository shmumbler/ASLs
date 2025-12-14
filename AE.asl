// 	Autosplitter for Apparatus: Exanimus
// 	Supports IGT, Autostart, Autoreset
//	Thanks to StreetBackGuy for assistance with TimeSpan math

state("Apparatus Exanimus")
{
	double inGameTimer: "Apparatus Exanimus.exe", 0x5CF1840, 0x350, 0x20, 0x0, 0x3B0, 0x188, 0x10, 0x68, 0x20, 0x0, 0x20, 0x70;
}

init
{
    vars.IGT = new TimeSpan();
	vars.old = new TimeSpan();
}

start 
{
	if (current.inGameTimer > old.inGameTimer) 		
	{
		return current.inGameTimer > 0;				
	}
}

onStart
{
    vars.IGT = TimeSpan.Zero;
	vars.old = TimeSpan.Zero;
}

isLoading
{
	return current.inGameTimer == old.inGameTimer;		
}

update
{
    if(current.inGameTimer==0 && old.inGameTimer!=0)
    {
        vars.IGT += TimeSpan.FromSeconds(old.inGameTimer);						//Save IGT at death.
    }
	if(current.inGameTimer!=0 && old.inGameTimer==0)					
	{
		vars.old += TimeSpan.FromSeconds(current.inGameTimer);					//Save IGT from load.
	}
}

gameTime
{
	return TimeSpan.FromSeconds(current.inGameTimer) + vars.IGT - vars.old;		//Return IGT plus delta.
}

reset
{
	if (old.inGameTimer == 0) {													//	IGT becomes zero for a multi-frame window between loads.
		if (current.inGameTimer != 0) {											//	Target first frame IGT becomes non-zero.
			return current.inGameTimer < 0.1;									//	Reset if first non-zero value of IGT is "close enough" to zero.
		}
	} else {return false;}
}	
