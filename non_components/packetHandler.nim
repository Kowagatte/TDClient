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
  print("Accept thread started.")
  echo "Reveiving message"
  let message = connection.receiveMessage()
  if message of ServerPacket_ResponsePacket:
    let resp = ServerPacket_ResponsePacket message
    echo resp.code
    echo resp.message
  echo "Received Message"
  packetQueue.send(message)
  echo "Enqueued."
  #print("Something")

proc dispatchThread() =
  print("Dispatch thread started.")
  while (var (available, data) = packetQueue.tryRecv; available):
    print("Dequeued.")
    #print("Something")
    discard #

proc startThreads*(connection: Connection) =
  print("Works like a charm")
  acceptingThread.createThread(acceptThread, connection)
  dispatchingThread.createThread(dispatchThread)
  #Crashes here
  print("Threads started.")
