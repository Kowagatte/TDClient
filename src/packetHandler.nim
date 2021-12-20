import connection
import godot
import godotinternal
import godotapi/[engine, node, thread]
import utils/packets
import std/locks

#TODO REMOVE GODOT STUFF AND START THREADS IN establishconnection.nim

gdobj PacketHandler of Node:

  var
    packetQueue: seq[Message]
    queueLock: Lock
    acceptingThread: Thread
    dispatchingThread: Thread

  method ready*() =
    initLock(self.queueLock)
    self.acceptingThread = gdnew[Thread]()
    self.dispatchingThread = gdnew[Thread]()
    discard self.acceptingThread.start(self, "_accept_thread")
    discard self.dispatchingThread.start(self, "_dispatch_thread")

  method acceptThread*(_: Node) =
    while wasConnected && isConnected():
      withLock(self.queueLock):
        self.packetQueue.add(receiveMessage())

  method dispatchThread*(_: Node) =
    withLock(self.queueLock):
      if len(self.packetQueue) > 0:
        #TODO dispatch
      else:
        discard #
