import std/net
import std/locks
import std/json

const connectionSettings = staticread("./connection_info.json")
let settingsAsJson = parseJson(connectionSettings)

let SERVER_IP = settingsAsJson["ip"].getStr
let PORT = Port(settingsAsJson["port"].getInt)

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

proc receiveData() =
  discard #TODO
