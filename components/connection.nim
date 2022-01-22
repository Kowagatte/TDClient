import std / [net, locks, json, strutils]
import ../non_components/packets
import gdnim, godotapi / [node]

#[
  Server details
]#
let
  SERVER_IP = "127.0.0.1"
  PORT = Port(8888)

#[
  Possible States the client can be in attempting a connection to the server TCP Socket.
]#
type ConnectionStatus* = enum
  STARTED = "Attempting to connect to the server.",
  TIMEOUT = "Timed out, attempting to reconnect.",
  FAILED = "Failed to connect to server.",
  SUCCESS = "Success, joining game."

#[
  Godot object representing a connection to the server.
  This object stores the socket connected to the main server.
  And methods to interact with the Server.
]#
gdnim Connection of Node:

  var
    socketLock: Lock
    serverSocket: Socket

  method init() =
    self.serverSocket = newSocket()
    initLock(self.socketLock)

  proc isConnected*(): bool =
    {.cast(gcsafe).}:
      if tryAcquire(self.socketLock):
        result = self.serverSocket.trySend("")
        release(self.socketLock)
      else:
        result = false

  proc connectServer*(): ConnectionStatus =
    {.cast(gcsafe).}:
      try:
        withLock(self.socketLock):
          self.serverSocket.connect(SERVER_IP, PORT, 5000)
          echo "connection init"
          echo self.serverSocket.getFd().int
        SUCCESS
      except IOError:
        FAILED
      except TimeoutError:
        TIMEOUT

  proc sendData*(msg: string) =
    {.cast(gcsafe).}:
      var conv = msg.len().int32
      discard self.serverSocket.send(conv.addr, sizeof(int32))
      self.serverSocket.send(msg)

  proc receiveMessage*(): Message =
    {.cast(gcsafe).}:
      echo "from receiveMessage"
      echo self.serverSocket.getFd().int
      echo self.isConnected()
      assert self.isConnected()
      var length: int32
      var raw: string
      #withLock(self.socketLock):
      echo "This Runs"
      try:
        echo self.serverSocket.recv(length.addr, 4)
        echo length
        discard self.serverSocket.recv(raw, length.int)
      except:
        echo getCurrentExceptionMsg()

      echo raw
      unpack(destruct(raw))


  proc receiveData*(): string =
    {.cast(gcsafe).}:
      if tryAcquire(self.socketLock):
        try:
          discard self.serverSocket.recv(result, 1024, 200)
        except:
          discard
      else:
        result = ""
