extends BaseTransite

func on_set_progress(progress:int):
	# Проверяем завершение загрузки в базовом классе
	if progress >= 100:
		_end_transite()
	$progress.value = progress
		
func _start_transite():
	$animations.stop()
	$progress.visible = false
	$progress.value = 0
	$animations.play("to_dark")
	
# После проверки значения прогресса понимаем, что загрузка новой сцены завершена.
func _end_transite():
	$progress.visible = false
	$animations.play("to_transparent")

func _on_animations_animation_finished(anim_name):
	match anim_name:
		"to_dark":
			$progress.visible = true
			emit_signal("send_backend_hide")
		# Новая сцена загружена и добавлена в дерево.
		# Сцена остаётся в памяти и должна управляться извне!
		"to_transparent":
			is_show = true
			emit_signal("send_backend_show")
			

