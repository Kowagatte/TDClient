import gdnim except Thread
import godotapi/[engine, node]
import packets
import std/locks
import ../components/connection

var
  packetQueue: Channel[Message]
  acceptingThread: system.Thread[Connection]
  dispatchingThread: system.Thread[void]

open packetQueue

#TODO figure out why having this thread started crashes the whole app
# Try running it with just print no loop, with loop, without connection
# arg. Compiler probably thinks its a funny guy.
proc acceptThread(connection: Connection) =
  while true:
    discard #
    #print("Something")

proc dispatchThread() =
  while (var (available, data) = packetQueue.tryRecv; available):
    discard #

proc startThreads*(connection: Connection) =
  print("Works like a charm")
  acceptingThread.createThread(acceptThread, connection)
  dispatchingThread.createThread(dispatchThread)
