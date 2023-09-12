extends Control

var _globals:Globals = Services.globals
var _inventory:Inventory = Services.inventory

@export var item_name:String = "None"


func _ready():
	## Из этой группы будем получать изменение предметов в инвентаре(определена в глобальном скрипте).
	add_to_group(_globals.get_group_name(Globals.Groups.INVENTORY_ITEM_CHANGED))
	if $MarginContainer/HBoxContainer/visual/progress.visible == true:
		$MarginContainer/HBoxContainer/visual/progress.max_value = _inventory.get_item(item_name)
		$MarginContainer/HBoxContainer/visual/progress.value = _inventory.get_item(item_name)
	if $MarginContainer/HBoxContainer/visual/digit.visible == true:
		$MarginContainer/HBoxContainer/visual/digit.text = str(_inventory.get_item(item_name))
	
func on_inventory_item_changed(_item_name:String, _item_count:int,  begin_value:bool):
	if _item_name == item_name:
		if begin_value == true:
			$MarginContainer/HBoxContainer/visual/progress.max_value = _item_count
			return
		$MarginContainer/HBoxContainer/visual/progress.value = _item_count
		$MarginContainer/HBoxContainer/visual/digit.text = str(_item_count)
	
