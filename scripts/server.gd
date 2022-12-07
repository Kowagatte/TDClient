extends Node2D

remote func test():
	print("Testing")

func login(email, password):
	rpc_id(1, "login", email, password)
