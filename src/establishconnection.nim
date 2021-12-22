import connection
import packetHandler
import godot
import godotapi/[engine, node, scene_tree, tree, thread, label]

#[
Connects the Client to the server, does this in a seperate thread
so the rendering is not blocked.
]#
gdobj EstablishConnection of Node:

  var outLog: Label
  var connectingThread: Thread

  method ready*() =
    self.outLog = self.getChild(1) as Label
    self.connectingThread = gdnew[Thread]()
    discard self.connectingThread.start(self, "_thread_function")

  method threadFunction*(_: Node) =
    var status: ConnectionStatus
    self.outLog.text = $status
    while status in {Started..Timeout}:
      status = connectServer()
      self.outLog.text = $status
    assert status == Success
    #Start the threads that collect packets
    startThreads(self)
    discard self.getTree().changeSceneImpl("res://scenes/LoginScreen.tscn")
