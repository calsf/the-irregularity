# Default behaviour for a damage enemy ranged object
# Destroyed upon hitting enemy or terrain, deals damage to enemy
extends DamageEnemy
class_name DefaultRanged

func _on_hit(other):
	if other.get_owner().is_in_group("enemies"):
		_add_meter()
		other.get_owner().update_health(-_damage)
		
		# Apply knockback based on pos on hit, most projectiles should have 0 _knockback
		var initial_dir = other.global_position - global_position
		other.get_owner().apply_knockback(initial_dir, _knockback)
		
		queue_free()
	else:
		queue_free()
