extends Node2D

const DISPLAY_PATH = "display/window/size/"
const FACTOR = 300

var direction = -1
var transparency_value = 255



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PressAnyKeyLabel.label_settings.font_color.a = transparency_value / 255.0
	transparency_value += FACTOR * delta * direction
	
	if transparency_value > 255 || transparency_value < 0:
		direction *= -1


func _draw():
	draw_rect(Rect2(
			  0, 
			  0, 
			  ProjectSettings.get(DISPLAY_PATH + "viewport_width"), 
			  ProjectSettings.get(DISPLAY_PATH + "viewport_height")), 
			  Color("#8C7369"), 
			  true, 
			  1.0)


