extends ColorRect

# class member variables go here, for example:
var a
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	margin_right = get_parent().get_parent().get_parent().bar-40
	a = int(255*(get_parent().get_parent().get_parent().bar-40)/330)
