import connection
import godot
import godotapi/[input, global_constants, engine, node, scene_tree, tree]

gdobj EstablishConnection of Node:

  var currentScene: Node

  method ready*() =
    var root = self.getTree().root
    self.currentScene = root.getChild(root.getChildCount() - 1)

  var time: float64 = 0
  method process*(delta: float64) =
    self.time += delta
    if not isConnected():
      print(self.time)
      if self.time > 1:
        self.time = 0
      print("Connection failed, trying again.")
      connectServer()

  method input*(event: InputEvent) =
    if isKeyPressed(KEY_T):
      if isConnected():
        print("works")
        #sendLogin("nnryanp@gmail.com", "12345qwesd")
