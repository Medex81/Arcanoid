## Оболочка локации с загружаемыми уровнями.
extends Location

@export_category("Arcanoid")
@export_file("*.tscn") var ball_proj:String
## Ресурс мяча.
var _ball_res:Resource

func _ready():
	## Инициализируем минимальный набор сервисов необходимый в каждой игре
	Services.resources
	Services.inventory
	super._ready()
	_ball_res = load(ball_proj)
	## Зогружаем уровень если указана директория с уровнями.
	if _level_node:
		$tiles_place.add_child(_level_node)
		## Подписываемся на завершение уровня (оно происходит при удачном завершении).
		_level_node.send_close.connect(level_passed)
		respown_ball()
	else:
		_logs.error("{0} location > level node for the level {1} wasn't loaded".format([name, _level_name]))

## проиграли
func close():
	super.close()
	for child in $platform/platform/ball_pos.get_children():
		child.close()
	_resources.save_state()

## выиграли	
func level_passed():
	super.level_passed()
	close()

## Условия проигрыша обновились (потеряли жизнь)
func condition_changed(_item_name:String, _count:int):
	if not conditions.is_empty():
		call_deferred("respown_ball")
	
func respown_ball():
	var ball = _ball_res.instantiate()
	$platform/platform/ball_pos.add_child(ball)
