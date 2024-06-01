extends PanelContainer

signal slot_clicked(index: int, button: int)

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect
@onready var quantity: Label = $Quantity

func SetSlotData(slot_data: SlotData) -> void:
	var item_data = slot_data.item_data
	texture_rect.texture = item_data.texture
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]

	if slot_data.quantity > 1:
		quantity.text = "x%s" % slot_data.quantity
		quantity.show()
	else:
		quantity.hide()

func _on_gui_input(event:InputEvent):
	if event is InputEventMouseButton && (event.button_index == MOUSE_BUTTON_LEFT || event.button_index == MOUSE_BUTTON_RIGHT) && event.is_pressed():
		slot_clicked.emit(get_index(), event.button_index)
