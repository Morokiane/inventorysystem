extends Resource
class_name SlotData

const maxStackSize: int = 99

@export var item_data: ItemData
@export_range(1, maxStackSize) var quantity: int = 1: set = SetQuantity

func SetQuantity(value: int) -> void:
	quantity = value
	if quantity > 1 && !item_data.stackable:
		quantity = 1
		push_error("%s is not stackable, setting to 1" % item_data.name)