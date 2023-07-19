extends AnimatedSprite2D

const SPEED = 100

var moving_down:  bool = false
var moving_up:    bool = false
var moving_left:  bool = false
var moving_right: bool = false

var has_animation_finished: bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		moving_down = true
		if has_animation_finished:
			self.play("walk_down")
	else:
		moving_down = false
	
	if Input.is_action_pressed("ui_up"):
		moving_up = true
		if has_animation_finished:
			self.play("walk_up")
	else:
		moving_up = false
		
	if Input.is_action_pressed("ui_left"):
		moving_left = true
		if has_animation_finished:
			self.play("walk_left")
	else:
		moving_left = false
		
	if Input.is_action_pressed("ui_right"):
		moving_right = true
		if has_animation_finished:
			self.play("walk_right")
	else:
		moving_right = false
		
	if moving_down:
		position.y += SPEED * delta
	if moving_up:
		position.y -= SPEED * delta
	if moving_left:
		position.x -= SPEED * delta
	if moving_right:
		position.x += SPEED * delta
	
	if not_moving():
		get_back_to_idle()


func get_back_to_idle() -> void:
	if self.animation == "walk_down":
		self.animation = "idle_front"
	if self.animation == "walk_up":
		self.animation = "idle_back"
	if self.animation == "walk_left":
		self.animation = "idle_left"
	if self.animation == "walk_right":
		self.animation = "idle_right"
	
	has_animation_finished = true
	
	
func not_moving() -> bool:
	return !moving_up && !moving_down && !moving_left && !moving_right
	
	
