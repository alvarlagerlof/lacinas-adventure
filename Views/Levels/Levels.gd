# Levels.gd

extends Control

onready var levelList = get_node("LevelList")

var levels = [
		{ "name":"Level 1", "desc":"Lorem ipsum...", "levelName": "Level1"},
		{ "name":"Level 2", "desc":"Dolor sit amet...", "levelName": "Level2"}
]


func _ready():
	#levelList.addItem("hejsan")
	
	for level in levels:
		levelList.add_item(level.name, null, true)


func _on_LevelList_item_selected(index):
	
	var level = levels[index].levelName


	
	SceneManager.open(level)


func _input(event):
	if event.is_action_pressed("back"):
		SceneManager.back()




func _on_Back_pressed():
	SceneManager.back()

