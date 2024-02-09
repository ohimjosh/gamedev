extends RigidBody2D
@onready var bomb = $"."


var picked = false

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../player/Marker2D").global_position
	
	
func _input(event):
	if Input.is_action_just_pressed("interact"):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "player" and get_node("../player").canPick == true:
				picked = true
				get_node("../player").canPick == false
				
				
	
	if Input.is_action_just_pressed("ui_focus_next") and picked == true:
		picked = false
		get_node("../player").canPick = true
		if get_node("../player/Sprite2D").flip_h == false:
			apply_impulse(Vector2(), Vector2(90, -10))
		else:
			apply_impulse(Vector2(), Vector2(-90, -10))
			

	if Input.is_action_just_pressed("ui_cancel") and picked == true:
		picked = false
		get_node("../player").canPick = true
		if get_node("../player").sprite_2d.flip_h == false:
			apply_impulse(Vector2(), Vector2(150, -200))
		else:
			apply_impulse(Vector2(), Vector2(-150, -200))

