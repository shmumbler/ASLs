
state("Dementium")
{
	uint cutState: "Dementium.exe", 0x3FC468, 0x8, 0x1630;
	uint lastCutscene: "Dementium.exe", 0x3FC468, 0x2BD8;
	int gameState: "Dementium.exe", 0x3A5320;
}


isLoading
{
	if ((current.gameState==131075) && (current.cutState!=4280894059)
	{
		return true;
	} else return false;
}

start
{
	return ((old.lastCutscene == 0) && (current.lastCutscene==1920233065));
}

split
{
	return ((old.cutState==4280894059) && (current.cutState==1885431907)) || ((old.cutState==4280894059) && (current.cutState==1851878753))
	|| ((current.lastCutscene==1634625894) && (old.lastCutscene!=1634625894)); 
}

reset
{
	return current.cutState==3160557864;
}