extends Control

var height
var width
var matrix = []
var mode = 0
var margin = 8
var color1 = Color.darkslateblue
var color2 = Color.black



func _ready():
	randomize()
	height = 8
	width = 15
	$ColorRect.color = color1
	for i in range(width):
		matrix.append([])
		matrix[i] = []
		for j in range(height):
			matrix[i].append([])
			matrix[i][j] = []
			for k in range(8):
				matrix[i][j].append([])
				matrix[i][j][k] = []
				for l in range(8):
					matrix[i][j][k].append([])
					if randi() % 2:
						matrix[i][j][k][l] = color1
					else:
						matrix[i][j][k][l] = color2

func _draw():
	var rectangulo : Rect2
	
	for i in range(width):
		for j in range(height):
			match mode:
				0:
					for k in range(4):
						for l in range(8):
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
							rectangulo = Rect2(margin+16*i+4+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][3-k][l])
				1:
					for k in range(8):
						for l in range(4):
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l+4, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][3-l])
				2:
					for k in range(4):
						for l in range(4):
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
							rectangulo = Rect2(margin+16*i+4+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][3-k][l])
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l+4, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][3-l])
							rectangulo = Rect2(margin+16*i+k+4, margin+16*j+l+4, 1, 1)
							draw_rect(rectangulo, matrix[i][j][3-k][3-l])
				3:
					for k in range(8):
						for l in range(0, k+1):
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
							rectangulo = Rect2(margin+16*i+l, margin+16*j+k, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
				4:
					for k in range(8):
						for l in range(7-k, 0, -1):
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
							rectangulo = Rect2(margin+16*i+7-l, margin+16*j+7-k, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
				5:
					for k in range(4):
						for l in range(8):
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
							rectangulo = Rect2(margin+16*i+4+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][3-k][7-l])
				6:
					for k in range(4):
						for l in range(4):
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][k][l])
							rectangulo = Rect2(margin+16*i+k+4, margin+16*j+l, 1, 1)
							draw_rect(rectangulo, matrix[i][j][l][3-k])
							rectangulo = Rect2(margin+16*i+k+4, margin+16*j+l+4, 1, 1)
							draw_rect(rectangulo, matrix[i][j][3-k][3-l])
							rectangulo = Rect2(margin+16*i+k, margin+16*j+l+4, 1, 1)
							draw_rect(rectangulo, matrix[i][j][3-l][k])

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_R and event.pressed:
			for i in range(width):
				for j in range(height):
					for k in range(8):
						for l in range(8):
							if randi() % 2:
								matrix[i][j][k][l] = color1
							else:
								matrix[i][j][k][l] = color2
			update()
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			if $ColorRect.color == color1:
				$ColorRect.color = color2
			else:
				$ColorRect.color = color1
		elif event.button_index == BUTTON_LEFT and event.pressed:
			mode = mode + 1
			if mode > 6: mode = 0
			$Sprite.frame = mode
			update()
