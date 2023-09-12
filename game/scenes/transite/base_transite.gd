# Сцена создаётся извне, скрывает старую сцену лежащую выше в дереве и открывает новую.
# Закрывает зависание при загрузке и инициализации тяжёлых сцен.

extends ColorRect

class_name BaseTransite

var _scenes:Scenes = Services.scenes
var is_show:bool = false

# Сигнал отправляется после завершения анимации затемнения (удаляется старая и начинается загрузка и инит новой сцены)
signal send_backend_hide()
signal send_backend_show()

# Снаружи передаём значения прогресса загрузки для отображения, при значении = 100 запускаем завершение транзита
func on_set_progress(progress:int):
	pass
		
# Транзитная сцена запускается при добавлении в дерево	
func _enter_tree():
	_scenes.send_progress.connect(on_set_progress)
	_start_transite()
	
func _exit_tree():
	_scenes.send_progress.disconnect(on_set_progress)
	
# Запускается анимация скрытия фона	
func _start_transite():
	pass
	
# Открываем новую сцену.	
func _end_transite():
	pass

