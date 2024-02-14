state("NecroVision")
{
    int loadingAddr    :   "Engine.dll", 0x4FC991C;
}



isLoading
{
    if(current.loadingAddr > 10) 
	{
		return true;
	}
	else 
	{
		return false;
	}
}