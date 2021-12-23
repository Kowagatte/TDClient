import ../non_components/[packetHandler]
import gdnim except Thread
import godotapi / [engine, node, scene_tree, tree, label]
import connection

#[
Connects the Client to the server, does this in a seperate thread
so the rendering is not blocked.
]#
gdnim EstablishConnection of Node:

  var outLog: Label
  var connectingThread: system.Thread[Node]
  var needsToChange: bool = false
  var connection: Connection

  method ready() =
    self.connection = self.get_node("/root/Connection") as Connection
    self.outLog = self.getChild(1) as Label
    self.connectingThread.createThread(threadFunction, self)

  method process(delta: float) =
    if self.needsToChange:
      discard self.getTree().changeSceneImpl("res://scenes/LoginScreen.tscn")

  proc threadFunction() =
    {.cast(gcsafe).}:
      var status: ConnectionStatus
      self.outLog.text = $status
      while status in {Started..Timeout}:
        status = self.connection.connectServer()
        self.outLog.text = $status
      assert status == Success
      print($status)
      #Start the threads that collect packets
      startThreads(self.connection)
      self.needsToChange = true
