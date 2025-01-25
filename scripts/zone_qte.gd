extends Area2D

signal QTEActif
signal QTEInactif



func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D") :
		QTEActif.emit()	
		$QTEManager.start_qte()
		



func _on_qte_manager_reussi() -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	QTEInactif.emit()
