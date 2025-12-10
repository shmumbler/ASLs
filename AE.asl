state("Apparatus Exanimus")
{
double inGameTimer: "Apparatus Exanimus.exe", 0x05CF1840, 0x350, 0x20, 0x0, 0x188, 0x10, 0x68, 0x20, 0x0, 0x20, 0x70;
}
isLoading
{
return old.inGameTimer == current.inGameTimer;
}
start 
{
return current.inGameTimer > 0;
}
reset
{
return current.inGameTimer == 0;
}
