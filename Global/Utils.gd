extends Node

var SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"playerHp": Game.playerHp,
		"gold": Game.gold
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				if current_line["playerHp"] == 0: 
					Game.playerHp = 100
				else:
					Game.playerHp = current_line["playerHp"]
				Game.gold = current_line["gold"]
