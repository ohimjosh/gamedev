extends StaticBody2D

var area_active = false
func _on_area_2d_body_entered(body):
	if "player" in body.name:
		area_active = true
		
	
		
func _on_area_2d_body_exited(body):
	if "player" in body.name:
		area_active = false
		
		
func _physics_process(_delta):
	if area_active and Input.is_action_just_pressed("interact"):
		print("pressed") #do stuff
