# SceneManager.gd

extends Node

var current_scene = null
var openScenes = []

var scenes = {
		"Start": "res://Views/Start/Start.tscn",
		"Levels": "res://Views/Levels/Levels.tscn",
		#"Settings": "res://Views/Settings/Settings.tscn",
		#"About": "res://Views/About.tscn"
		
		
		
		"Level1": "res://Levels/Level1/Level.tscn",
		"Level1-sub": "res://Levels/Level1/Sub.tscn",
		
		"Level2": "res://Levels/Level2/Level.tscn",
		"Level2-sub": "res://Levels/Level2/Sub.tscn",
		
}




func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )
	
	openScenes.append(scenes.Start)
	

	
	
func open(name):
	var path = scenes[name]
	#print("Opening: " + path)
	
	# Remove items after if jumping back
	if openScenes.has(path):
		var index = _index_of(openScenes, path)
		openScenes.resize(index+1)
		
	else:
		openScenes.append(path)
	

		
	# Open
	call_deferred("_deferred_goto_scene", scenes[name])
	
	
	
func back():
	var path = openScenes[-2]
	print("Going back to: " + path)

	call_deferred("_deferred_goto_scene", path)
	openScenes.pop_back()
	
	
	
func _process(delta):
	print(openScenes)
	
	
	
	
	
	
	
	
func _deferred_goto_scene(path):
	current_scene.free()
	
	var newScene = ResourceLoader.load(path)
	current_scene = newScene.instance()
	
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
	
	#print("Loaded: " + path)
	

	
	
func _index_of(array, search_value):
	for i in range(array.size()):
	    if array[i] == search_value:
	        return i