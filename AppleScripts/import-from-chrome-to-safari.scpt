-- close google chrome to perform importing
do shell script "killall \"Google Chrome\" || echo \"Google Chrome is not running.\""

tell application "Safari"
	open location "http://www.website.com/"
	activate
end tell

-- tell application "System Events" to set visible of application process "Safari" to false

-- import history, bookmarks, passwords from google chrome to safari
tell application "System Events"
	tell process "Safari"
		repeat until menu bar 1 exists
			delay 0.1
		end repeat
		
		log "Syncing..."
		
		tell menu bar item "File" of menu bar 1
			click
			click menu item "Import From" of its menu
			click menu item "Google Chrome..." of its menu item
			keystroke return
			delay 5
			keystroke return
			delay 5
			keystroke return
		end tell
	end tell
end tell

log "Complete sync"
delay 2
-- close safari
do shell script "killall Safari || echo \"Safari is not running.\""

-- restore chrome closed tabs and minimize window in background
log "Opening chrome in background"
do shell script "open -a \"Google Chrome\" --args --restore-last-session --no-startup-window"
