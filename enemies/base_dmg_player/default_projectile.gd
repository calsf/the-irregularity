# Default behaviour for a damage player projectile
# Destroyed upon hitting player or terrain, deals damage to player
extends DamagePlayer
class_name DefaultProjectile

# If hits with anything in layer mask, destroys this projectile
func _on_hit(other):
	queue_free()

# Transition from start up to loop animation
func _on_AnimationPlayer_animation_finished(anim_name):
	_anim.play("loop")