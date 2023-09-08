extends BaseItem


func _ready():
	super._ready()
	$ball.apply_impulse(Vector2(250, -250))
