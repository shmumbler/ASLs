state("NecroVision")
{
    int loadingAddr    :   "Engine.dll", 0x4FA304C;
}



isLoading
{
    if(current.loadingAddr > 11) 
	{
		return true;
	}
	else 
	{
		return false;
	}
}