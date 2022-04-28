;Jacob Thomas
;Final Fantasy XIV script, quality of life improvements, launch game
;Created April 1st, 2022





;Mouseclick in Final Fantasy
#IF WinActive("ahk_exe ffxiv_dx11.exe")
`::
	Mouseclick, left
return




;Only in Final Fantasy, fixes mistyped emote command
::/me::
send /emote{space}
return


;Only take screenshots when not in FF
Printscreen::
Send ^!{F7}
return
#If




;Launch FF14 client
^F1::

;If open do nothing
IfWinExist, ahk_exe ffxiv_dx11.exe
{
	return
}

;If open do nothing
IfWinExist, ahk_class Diablo II
{
	Send {F1}
	return
}

CoordMode, Mouse, Window

;Launch FF14 if doesn't exist
IfWinNotExist, ahk_exe ffxivlauncher.exe
{
	run, "C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV - A Realm Reborn\boot\ffxivboot.exe"
}

loop
{
	if WinExist("ahk_exe ffxivlauncher.exe")
	{
		WinActivate
		sleep 750
		break
	}
}

loop
{
#If WinActive("ahk_exe ffxivlauncher.exe")
	
	;Click into password field
	ImageSearch, foundx,foundy , 0, 0, 1919, 1079,  C:\AutoHotKeyScripts\Pictures\FF14\Launcher.png
	if ErrorLevel = 0
	{
		mouseclick, left, ValueSent(foundx+85,80), ValueSent(foundy+60,2)
		sleep 1000
		
		Send PasswordHere{enter}
	}
		
	;Click the play button
	ImageSearch, foundx,foundy , 0, 0, 1919, 1079,  *TransBlack C:\AutoHotKeyScripts\Pictures\FF14\Play.png
	if ErrorLevel = 0
	{
		mouseclick, left, ValueSent(foundx+25,80), ValueSent(foundy,5)
		break
	}
}
#If

	Sleep 5000
loop
{
#If WinActive("ahk_exe ffxivlauncher.exe")
		
	;Click the play button
	ImageSearch, foundx,foundy , 0, 0, 1919, 1079,  *TransBlack C:\AutoHotKeyScripts\Pictures\FF14\Play2.png
	if ErrorLevel = 0
	{
		mouseclick, left, ValueSent(foundx+25,80), ValueSent(foundy,5)
	}
#If

#If WinActive("ahk_exe ffxiv_dx11.exe")
	;Main screen Click
	SeqGUIMain2("Looking for main screen", 1589, 392)
	ImageSearch, foundx,foundy , 0, 0, A_Screenwidth, A_Screenheight,  *100 C:\AutoHotKeyScripts\Pictures\FF14\MainScreen.jpg
	if ErrorLevel = 0
	{
		;mouseclick, left, ValueSent(foundx+50,20), ValueSent(foundy-210,2)
		SeqGUIMain2("Found screen, clicking Start", 1589, 392)
		mousemove, ValueSent(foundx+50,20), ValueSent(foundy-210,2)
		sleep ValueSent(1000, 150)
		mouseclick, left
		sleep 50
		mouseclick, left,,,,,U
		break
	}
	Sleep 1000
}

loop
{
	;Click character 1
	SeqGUIMain2("Looking for Character screen", 1589, 392)
	ImageSearch, foundx,foundy , 0, 0, A_Screenwidth, A_Screenheight,  *100 C:\AutoHotKeyScripts\Pictures\FF14\CharScreen.jpg
	if ErrorLevel = 0
	{	
		;mouseclick, left, ValueSent(foundx+50,20), ValueSent(foundy-210,2)
		SeqGUIMain2("Found character, clicking name", 1589, 392)
		mousemove, ValueSent(foundx+1550,50), ValueSent(foundy+70,2)
		sleep ValueSent(1000, 150)
		mouseclick, left
		sleep 50
		mouseclick, left,,,,,U
		Sleep ValueSent (2500, 650)
	}
	
	;Click okay button
	SeqGUIMain2("Looking for okay button", 1589, 392)
	ImageSearch, foundx,foundy , 0, 0, A_Screenwidth, A_Screenheight,  C:\AutoHotKeyScripts\Pictures\FF14\OkayButton.png
	if ErrorLevel = 0
	{	
		SeqGUIMain2("Found okay button - clicking", 1589, 392)
		mousemove, ValueSent(foundx+15,35), ValueSent(foundy,2)
		sleep ValueSent(1000, 150)
		mouseclick, left
		sleep 50
		mouseclick, left,,,,,U
		;SeqGUIMain2("",0,0)
		reload
		
	}
	Sleep 1000
}	
#If
return 



#If WinActive("ahk_exe ffxiv_dx11.exe")
;/*
;Desynthesize, click yes, 
F12::
SeqGUIMain2("Running", 1615, 200)
while seqNumber < 65
{
	;Yes desynthesize item
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\Desynthesize.png
	if ErrorLevel = 0
	{
		MouseGetPos, xpos, ypos
		sleep ValueSent(500, 100)
		mousemove, ValueSent(FoundX+35, 15), ValueSent(FoundY+2, 2) 
		sleep ValueSent(100, 20)
		mouseclick, left
		sleep 50
		mouseclick, left,,,,,U
		Sleep 500
		mousemove, ValueSent(xpos,20), ValueSent(ypos,20)
	}
	
	;Click deliver for seals
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\Deliver.png
	if ErrorLevel = 0
	{
		blockinput, On
		MouseGetPos, xpos, ypos
		sleep ValueSent(500, 100)
		mousemove, ValueSent(FoundX+15, 10), ValueSent(FoundY+2, 2) 
		sleep ValueSent(100, 20)
		mouseclick, left
		sleep 50
		mouseclick, left,,,,,U
		Sleep 500
		mousemove, ValueSent(xpos,20), ValueSent(ypos,20)
		blockinput, Off
	}
	
	;Click yes to feed chocobo anyhow
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\YesFeedChocobo.png
	if ErrorLevel = 0
	{
		MouseGetPos, xpos, ypos
		sleep ValueSent(500, 100)
		mousemove, ValueSent(FoundX+15, 10), ValueSent(FoundY+2, 2) 
		sleep ValueSent(100, 20)
		mouseclick, left
		sleep ValueSent(50, 10)
		mouseclick, left,,,,,U
		Sleep 500
		mousemove, ValueSent(xpos,20), ValueSent(ypos,20)
	}
	
	;Skip Chocobo feeding cutscene
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\YesSkipCutScene.png
	if ErrorLevel = 0
	{
		MouseGetPos, xpos, ypos
		sleep ValueSent(500, 100)
		mousemove, ValueSent(FoundX+100, 40), ValueSent (FoundY+2, 2) 
		sleep ValueSent(100, 20)
		mouseclick, left
		sleep ValueSent(50, 10)
		mouseclick, left,,,,,U
		Sleep 500
		mousemove, ValueSent(xpos,20), ValueSent(ypos,20)
	}
	;Look for Dungeon popup
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\DungeonReady.jpg
	if ErrorLevel = 0
	{
		loop 20
		{
			SoundPlay, C:\Users\Seq\Downloads\icq.mp3
			Sleep 10000
		}
	}
	;Look for Dungeon popup
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\DungeonReady.png
	if ErrorLevel = 0
	{
		loop 20
		{
			SoundPlay, C:\Users\Seq\Downloads\icq.mp3
			Sleep 5000
		}
	}
	
	;Generic 'yes'
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\Yes.png
	if ErrorLevel = 0
	{
		MouseGetPos, xpos, ypos
		sleep ValueSent(500, 100)
		mousemove, ValueSent(FoundX+15, 10), ValueSent(FoundY+2, 2) 
		sleep ValueSent(100, 20)
		mouseclick, left
		sleep ValueSent(50, 10)
		mouseclick, left,,,,,U
		Sleep 500
		mousemove, ValueSent(xpos,20), ValueSent(ypos,20)
	}	
}
#If
return
*/




#If WinActive("ahk_exe ffxiv_dx11.exe")
;Try clicking the auction house button to compare prices
~F5::
blockinput, On
loop 1
{
	CoordMode, Mouse, Screen
	MouseGetPos, xpos, ypos 
	
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, *50 C:\AutoHotKeyScripts\Pictures\FF14\MarketBoard3.png
	if ErrorLevel = 0
	{
		mousemove, ValueSent(FoundX-3,2), ValueSent(FoundY-3,2)
		sleep 100
		mouseclick, left

		sleep 50
		mouseclick, left,,,,,U
	
		sleep 50
		mousemove, xpos, ypos
		break
	}
	sleep 150

	ImageSearch,foundx,foundy, 0,0, 1919, 1079, *50 C:\AutoHotKeyScripts\Pictures\FF14\MarketBoard2.png
	if ErrorLevel = 0
	{
		mousemove, ValueSent(FoundX-3,2), ValueSent(FoundY-3,2)
		sleep 100
		mouseclick, left

		sleep 50
		mouseclick, left,,,,,U
	
		sleep 50
		mousemove, xpos, ypos
		break
	}
	sleep 150
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, *50 C:\AutoHotKeyScripts\Pictures\FF14\MarketBoard.png
	if ErrorLevel = 0
	{
		mousemove, ValueSent(FoundX-3,2), ValueSent(FoundY-3,2)
		sleep 100
		mouseclick, left

		sleep 50
		mouseclick, left,,,,,U
	
		sleep 50
		mousemove, xpos, ypos
		break
	}
	sleep 150
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, *50 C:\AutoHotKeyScripts\Pictures\FF14\Sort.png
	if ErrorLevel = 0
	{
		mousemove, ValueSent(FoundX+15,15), ValueSent(FoundY-3,2)
		sleep 100
		mouseclick, left

		sleep 50
		mouseclick, left,,,,,U
	
		sleep 50
		mousemove, xpos, ypos
		break
	}
	Sleep 2000
	
}
blockinput, Off
#If
return

#If WinActive("ahk_exe ffxiv_dx11.exe")
;Try clicking the auction house button to submit price
~F6::
ImageSearch,foundx,foundy, 0,0, 1919, 1079, *75 C:\AutoHotKeyScripts\Pictures\FF14\Confirm.png
if ErrorLevel = 0
{
	blockinput, On
	CoordMode, Mouse, Screen
	MouseGetPos, xpos, ypos 
	
	mousemove, ValueSent(FoundX+5,5), ValueSent(FoundY,2)
	sleep 100
	mouseclick, left

	sleep 50
	mouseclick, left,,,,,U
	sleep 50
	mousemove, xpos, ypos
	blockinput, Off
}

ImageSearch,foundx,foundy, 0,0, 1919, 1079, *50 C:\AutoHotKeyScripts\Pictures\FF14\ReturnToInventory.png
if ErrorLevel = 0
{
	MouseGetPos, xpos, ypos 
	sleep 50
	mousemove, ValueSent(FoundX+15,15), ValueSent(FoundY-3,2)
	sleep 100
	mouseclick, left

	sleep 50
	mouseclick, left,,,,,U

	sleep 50
	mousemove, xpos, ypos
}
return
#If



;TransBlack = setting a rectangle of black = white 
::seqloadff14::
CoordMode, Mouse, Window

;Launch FF14 if doesn't exist
IfWinNotExist, ahk_exe ffxivlauncher.exe
		{
			run, "C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV - A Realm Reborn\boot\ffxivboot.exe"			
		}

loop
{
#If WinActive("ahk_exe ffxivlauncher.exe")
	
	;Click into password field
	ImageSearch, foundx,foundy , 0, 0, 1919, 1079,  C:\AutoHotKeyScripts\Pictures\FF14\Launcher.png
	if ErrorLevel = 0
	{
		mouseclick, left, ValueSent(foundx+85,80), ValueSent(foundy+60,2)
		sleep 1000
		
		Send Always69{enter}
	}
		
	;Click the play button
	ImageSearch, foundx,foundy , 0, 0, 1919, 1079,  *TransBlack C:\AutoHotKeyScripts\Pictures\FF14\Play.png
	if ErrorLevel = 0
	{
		mouseclick, left, ValueSent(foundx+25,80), ValueSent(foundy,5)
		break
	}
	Sleep 1500	
#If
}

#IF WinActive("ahk_exe ffxiv_dx11.exe")
loop
{
	;Click the Start Button on main screen (need 2 clicks for some reason?)
	ImageSearch, foundx,foundy , 500, 500, 1919, 1079,  *TransBlack C:\AutoHotKeyScripts\Pictures\FF14\Start.png
	if ErrorLevel = 0
	{
		mouseclick, left, ValueSent(foundx+50,25), ValueSent(foundy,3)
		sleep ValueSent(150,50)
		mouseclick, left, ValueSent(foundx+50,25), ValueSent(foundy,3)
		break
	}
	Sleep 750
}

loop
{
	;Click the Character from select screen
	ImageSearch, foundx,foundy , 0, 0, 1919, 1079,  *TransBlack C:\AutoHotKeyScripts\Pictures\FF14\Seq.png
	if ErrorLevel = 0
	{
		mouseclick, left, ValueSent(foundx+150,150), ValueSent(foundy, 3)
		sleep ValueSent(150,50)
		mouseclick, left, ValueSent(foundx+150,150), ValueSent(foundy, 3)
		break
	}
}


loop
{
	;Click the 'okay' button to login
	ImageSearch, foundx,foundy , 0, 0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\FF14\OkayButton.png
	{
		mouseclick, left, ValueSent(foundx+15,35), ValueSent(foundy , 2)
		break
	}
}

#IF

return



;Send details in ff14
#If WinActive("ahk_exe ffxivlauncher.exe")
Pause::
	CoordMode, Mouse, Window
	mouseclick, left, 888, 175
	Sleep 250
	Send {tab 2}
	Sleep 250
	Send Always69{enter}
	
	loop
	{
		sleep 1000
		ImageSearch, foundx, foundy, 0, 0, 1919, 1079, *50 C:\AutoHotKeyScripts\Pictures\FF14\Play.png
        if (ErrorLevel = 0) 
		{
			mouseclick, left, ValueSent(foundx+25,105), ValueSent(foundy,7)
			
			/*
			sleep 1000
			ImageSearch, foundx, foundy, 0, 0, 1919, 1079, *25 C:\AutoHotKeyScripts\Pictures\FF14\Start.png
			if (ErrorLevel = 0) 
			{
				
			}
			*/
		}
	}
return

#IF !WinActive("FINAL FANTASY XIV")
Scrolllock::
{
CoordMode, Mouse, Screen
MouseGetPos, xpos, ypos 
clipboard = %xpos%, %ypos%
Msgbox, %xpos%, %ypos%
}
return

/*
;Useful for mapping key to '0' in Final Fantasy
Numpad0::
send .
return
*/

#IF



#If



/*
#If WinActive("ahk_exe ffxiv_dx11.exe")
;FF14 crafting thing, comment out when not using
j::
SeqRunAmount = 30
SeqGUIMain("Starting")
while (seqNumber != SeqRunAmount)
{
	ImageSearch,foundx,foundy, 0,0, 1919, 1079, *35 C:\AutoHotKeyScripts\Pictures\FF14\Synthesize.png
	if ErrorLevel = 0
	{
		SeqGUIMain("Count: " seqNumber+1 " out of " SeqRunAmount)
		;mousemove, ValueSent(FoundX+40,30), ValueSent(FoundY+5,5)
		mousemove, ValueSent(FoundX+20,30), ValueSent(FoundY,5)
		sleep 100
		mouseclick, left

		sleep 50
		mouseclick, left,,,,,U
		sleep ValueSent(1250, 100)
		Send {Numpad0}
		mousemove, ValueSent(500,25), ValueSent(500,20)
		sleep ValueSent(1750,400)
		seqNumber++
	}
sleep 2000
}
		loop 20
		{
			SoundPlay, C:\Users\Seq\Downloads\icq.mp3
			Sleep 15000
		}

return
#If
*/
