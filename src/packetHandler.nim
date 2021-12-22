import connection
import godot
import godotinternal
import godotapi/[engine, node, thread]
import utils/packets
import std/locks

var
  packetQueue: seq[Message]
  queueLock: Lock
  acceptingThread: Thread
  dispatchingThread: Thread

initLock(queueLock)

#TODO

proc testMethod*() =
  #Client runs this?
  print("This is running")

proc startThreads*(self: Node) =
  #Client crashes here?? Nvm it stopped?
  acceptingThread = gdnew[Thread]()
  dispatchingThread = gdnew[Thread]()
  discard acceptingThread.start(self, "_accept_thread")
  discard dispatchingThread.start(self, "_dispatch_thread")

proc acceptThread*(_: Node) =
  while isConnected():
    withLock(queueLock):
      packetQueue.add(receiveMessage())

proc dispatchThread*(_: Node) =
  withLock(queueLock):
    if len(packetQueue) > 0:
      #TODO dispatch
      discard #
    else:
      discard #
