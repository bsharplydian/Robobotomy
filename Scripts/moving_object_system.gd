extends Node3D
## besides the Path, Body, and Movement Mode, this node also needs two signals attached: activate and deactivate

enum MovementMode {
	normal,
	#pingpong,
	#loop
}
@export_multiline var note: String = "Besides supplying these three variables, you must also attach signals to activateSystem() and deactivateSystem().\nEasiest to use when your AnimatableBody and Path are parented to this node, and the signal emitter is not."

## keep the first point's position at (0, 0, 0) and use the base transform to move the curve around
@export var path: Path3D
## must also contain a CollisionShape3D and MeshInstance3D, just like you would with a rigid body
@export var animatableBody: AnimatableBody3D
## right now just has normal mode but can be expanded
@export var movementMode: MovementMode

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MovingObjectPath.curve = path.curve;
	$MovingObjectPath/PathFollow3D/RemoteTransform3D.remote_path = animatableBody.get_path()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func activateSystem(body: Node3D):
	$MovingObjectPath._on_activated(body);
func deactivateSyste(body: Node3D):
	$MovingObjectPath._on_deactivated(body)
