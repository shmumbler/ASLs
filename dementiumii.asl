
state("Dementium II")
{
	int levelTime: "Dementium II.exe", 0x4F0950, 0x58, 0x144;	//Resets to 0 each level, pauses when desired
	int IGT: "Dementium II.exe", 0x4F0950, 0x407C;				//Only resets on New Game, but pauses inappropriately
	ulong roomID: "Dementium II.exe", 0x4F0950, 0x4080;			
}

startup
{
	refreshRate = 30;											//IGT ticks at 30Hz
}

isLoading
{
	return current.levelTime==old.levelTime;
}

start
{
	return old.roomID==0 && current.roomID==52983528108144;
}

split
{
	if (current.roomID!=52983528108144) 								//Ensures game doesn't falsely split when watching the intro cutscene
	{	
		return (current.levelTime==1 && old.levelTime==0) || (old.roomID==56299242860656 && current.roomID==56299242860544);
	} 
}

reset
{
	return current.IGT==0;										
}