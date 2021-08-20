extends KinematicBody2D
class_name Blue
const stats = {
	"animations":"res://Characters/Animation/Blue.tres",
	"health"    : 150 ,
	"movespeed" : 1250,
	"gun speed" : 0.2 ,
	"gun damage": 30  ,
	"ability no": 25  ,
	"ability cd": 0.05,
	"recovery"  : 3.0 ,
	}
	
const health = 150
const animations = "res://Characters/Animation/Blue.tres"
const movespeed = 1250
const gunspeed = 0.2
const gundmg = 30
const ability = 25
const cooldown = 0.05
const recovery = 3.0
var count = 25
var time = 0


static func power(pos):
	print("ability")
	if get_node("Ability Timer").get_time_left() == 0 and count > 0:
		get_node("Ability Timer").start()
		get_node("Recovery Timer").start()
		var block =preload("res://Characters/Block.tscn").instance()
		if (get_global_mouse_position()-pos).length() <= 300:
			block.global_position = get_global_mouse_position()
		else:
			block.position = pos + get_local_mouse_position().normalized()*300 + Vector2(0,0)
			get_parent().get_node("Navigation2D/TileMap").add_child( block )
		count -= 1

func _process(delta):
	if get_node("Recovery Timer").time_left == 0 and count <ability:
		time += delta
		if delta >= 0.05:
			time = 0
			count += 1
	else:
		time = 0


