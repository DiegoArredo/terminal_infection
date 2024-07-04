extends Node
var url = "https://ucn-game-server.martux.cl/scores"
var auth_header = "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1YWYzNDg3Yy04MmE2LTQzMzItOTNjMy0zZWY2YjQ3OWM0OWEiLCJrZXkiOiJRRmhqckdyR01wYjMwQUVCVkYwaFdtYkNkIiwiaWF0IjoxNzE5NDYxNTMzLCJleHAiOjE3NTA5OTc1MzN9.g-H1jkYKOTz_37c3UcBsDiMvCJWrfBOq8E7sLlH5UCI"
var METHOD_GET = 0
var METHOD_POST = 2
var METHOD_DELETE = 4


func obtener_puntajes():
	var error = $HTTPRequest.request(url, [auth_header], METHOD_GET)
	if error != OK:
		print(error)
		push_warning("An error occurred in the HTTP request.")
	
func _on_request_completed(_result, _response_code, _headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print(response)
	if response:
		#OBTENER PUNTAJES DEL RESPONSE
		if response["message"] == "Score List Received":
			#print(response)
			#func reverse_dictionary(original_dict):
				#var reversed_dict = {}
				#
				#for key in original_dict.keys():
					#var value = original_dict[key]
					#reversed_dict[value] = key
				#return reversed_dict
				
			for i in response["data"]:
				var nombre = Label.new()
				nombre.text = i["playerName"]
				var puntaje = Label.new()
				puntaje.text = str(i["score"])
				%TablaPuntajes.add_child(nombre)
				%TablaPuntajes.add_child(puntaje)
				#print(i["id"], i["playerName"], i["score"])

		
func _enviar_puntajes(nombre : String, puntaje : int):
	var body =  JSON.stringify({"playerName": nombre, "score" : puntaje})
	var headers = [auth_header, "Content-Type: application/json", ]
	$HTTPRequest.request(url, headers, METHOD_POST, body)
	


func _on_refresh_pressed():
	%TablaPuntajes.limpiar()
	obtener_puntajes() # Replace with function body.

