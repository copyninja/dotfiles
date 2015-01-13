import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHooks = composeAll
                [ className =? "URxvt" --> doShift "1:term"
                , className =? "Iceweasel" --> doShift "2:browse"
                , className =? "Emacs" --> doShift "4:dev"
                , className =? "Quasselclient" --> doFloat
                , className =? "Quasselclient" --> doShift "3:im"
                , className =? "Skype" --> doFloat
                , className =? "Skype" --> doShift "3:im"
                , manageDocks
                 
                ]
main :: IO()
main = do
     xmproc <- spawnPipe "/usr/bin/xmobar /home/vasudev/.xmobarrc"
     xmonad $ defaultConfig
         { workspaces = ["1:term", "2:browse", "3:im", "4:dev", "5", "6:video",
                                     "7", "8", "9", "0", "-", "="]
         , manageHook = manageDocks <+> myManageHooks
                        <+> manageHook defaultConfig
         , layoutHook = avoidStruts $ layoutHook defaultConfig
         , logHook = dynamicLogWithPP xmobarPP
                     {
                        ppOutput = hPutStrLn xmproc,
                        ppTitle = xmobarColor "green" "" . shorten 50
                     }
         , modMask = mod4Mask
         } `additionalKeys`
         [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
         , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
         , ((0, xK_Print), spawn "scrot")
	 ]
