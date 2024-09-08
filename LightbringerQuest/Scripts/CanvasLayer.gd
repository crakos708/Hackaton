extends CanvasLayer
var hpNumber = 100
var prisms = 0
func _ready():
	$PrismNumber.text = String(prisms)
	$HPNumber.text = String(hpNumber)

func handlePrismCollected():
	print ("Prism Collected")
	prisms += 10
	$PrismNumber.text = String(prisms)
func handleHPNumber():
	print ("1HP lost")
	hpNumber -= 20
	$HPNumber.text = String(hpNumber)
