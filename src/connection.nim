import std/net
import std/locks
import std/json
import utils/packets
import godot

const connectionSettings = staticread("./connection_info.json")
let
  settingsAsJson = parseJson(connectionSettings)
  SERVER_IP = settingsAsJson["ip"].getStr
  PORT = Port(settingsAsJson["port"].getInt)

var
  serverSocket: Socket = newSocket()
  socketLock: Lock

type ConnectionStatus* = enum
  STARTED = "Attempting to connect to the server."
  TIMEOUT = "Timed out, attempting to reconnect.",
  FAILED = "Failed to connect to server.",
  SUCCESS = "Success, joining game."

initLock(socketLock)

proc isConnected*(): bool =
  if tryAcquire(socketLock):
      result = serverSocket.trySend("")
      release(socketLock)
  else:
    result = false

proc connectServer*(): ConnectionStatus =
  try:
    withLock(socketLock):
      serverSocket.connect(SERVER_IP, PORT, 5000)
    SUCCESS
  except IOError:
    FAILED
  except TimeoutError:
    TIMEOUT

proc sendData*(msg: string) =
  withLock(socketLock):
    serverSocket.send(msg)

proc receiveMessage*(): Message =
  if tryAcquire(socketLock):
    var raw: string
    try:
      #TODO Use SocketStream to get all available bytes instead of a fixed number.
      print(serverSocket.recv(raw, 74, 1000))
    except:
      discard
    raw.setlen(74)
    unpack(destruct(raw))
  else:
    nil

proc receiveData*(): string =
  if tryAcquire(socketLock):
    try:
      discard serverSocket.recv(result, 1024, 200)
    except:
      discard
  else:
    result = ""
