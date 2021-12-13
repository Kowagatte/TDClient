import std/net
import packets_pb

const SERVER_IP = "127.0.0.1"
const PORT = Port(8888)

let serverSocket = newSocket()

proc isConnected(): bool =
  serverSocket.trySend("")

proc connectServer(): bool =
  try:
    serverSocket.connect(SERVER_IP, PORT)
    true
  except:
    false

proc sendMsg(msg: string) =
  serverSocket.send(msg)

proc sendLogin(email: string, password: string) =
  var loginPacket = newClientPacket_DummyPacket()
  loginPacket.email = email
  loginPacket.password = password
  serverSocket.send(serialize(loginPacket))

proc receiveData() =
  discard #TODO

import godot
import godotapi/[input, global_constants, engine, node, scene_tree, tree]

gdobj Client of Node:

  var currentScene: Node

  method ready*() =
    var root = self.getTree().root
    self.currentScene = root.getChild(root.getChildCount() - 1)

  method process*(delta: float64) =
    if not isConnected():
      print("Connection failed, trying again.")
      discard connectServer()

  method input*(event: InputEvent) =
    if isKeyPressed(KEY_T):
      if isConnected():
        sendLogin("nnryanp@gmail.com", "12345qwesd")
        #sendMsg("something")
