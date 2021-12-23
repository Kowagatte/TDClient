# Generated by protoc_gen_nim. Do not edit!

import base64
import intsets
import json
import strutils

import nimpb/nimpb
import nimpb/json as nimpb_json

type
    ServerPacket* = ref ServerPacketObj
    ServerPacketObj* = object of Message
    ServerPacket_PingPacket* = ref ServerPacket_PingPacketObj
    ServerPacket_PingPacketObj* = object of Message
    ServerPacket_ResponsePacket* = ref ServerPacket_ResponsePacketObj
    ServerPacket_ResponsePacketObj* = object of Message
        code: int32
        message: string
    ClientPacket* = ref ClientPacketObj
    ClientPacketObj* = object of Message
    ClientPacket_PongPacket* = ref ClientPacket_PongPacketObj
    ClientPacket_PongPacketObj* = object of Message
    ClientPacket_ClosePacket* = ref ClientPacket_ClosePacketObj
    ClientPacket_ClosePacketObj* = object of Message
    ClientPacket_CreateAccountPacket* = ref ClientPacket_CreateAccountPacketObj
    ClientPacket_CreateAccountPacketObj* = object of Message
        email: string
        username: string
        password: string
    ClientPacket_DummyPacket* = ref ClientPacket_DummyPacketObj
    ClientPacket_DummyPacketObj* = object of Message
        email: string
        password: string
    ClientPacket_LoginPacket* = ref ClientPacket_LoginPacketObj
    ClientPacket_LoginPacketObj* = object of Message
        email: string
        password: string

proc newServerPacket_ResponsePacket*(): ServerPacket_ResponsePacket
proc newServerPacket_ResponsePacket*(data: string): ServerPacket_ResponsePacket
proc newServerPacket_ResponsePacket*(data: seq[byte]): ServerPacket_ResponsePacket
proc writeServerPacket_ResponsePacket*(stream: Stream, message: ServerPacket_ResponsePacket)
proc readServerPacket_ResponsePacket*(stream: Stream): ServerPacket_ResponsePacket
proc sizeOfServerPacket_ResponsePacket*(message: ServerPacket_ResponsePacket): uint64
proc toJson*(message: ServerPacket_ResponsePacket): JsonNode
proc parseServerPacket_ResponsePacket*(obj: JsonNode): ServerPacket_ResponsePacket

proc newClientPacket_LoginPacket*(): ClientPacket_LoginPacket
proc newClientPacket_LoginPacket*(data: string): ClientPacket_LoginPacket
proc newClientPacket_LoginPacket*(data: seq[byte]): ClientPacket_LoginPacket
proc writeClientPacket_LoginPacket*(stream: Stream, message: ClientPacket_LoginPacket)
proc readClientPacket_LoginPacket*(stream: Stream): ClientPacket_LoginPacket
proc sizeOfClientPacket_LoginPacket*(message: ClientPacket_LoginPacket): uint64
proc toJson*(message: ClientPacket_LoginPacket): JsonNode
proc parseClientPacket_LoginPacket*(obj: JsonNode): ClientPacket_LoginPacket

proc newServerPacket_PingPacket*(): ServerPacket_PingPacket
proc newServerPacket_PingPacket*(data: string): ServerPacket_PingPacket
proc newServerPacket_PingPacket*(data: seq[byte]): ServerPacket_PingPacket
proc writeServerPacket_PingPacket*(stream: Stream, message: ServerPacket_PingPacket)
proc readServerPacket_PingPacket*(stream: Stream): ServerPacket_PingPacket
proc sizeOfServerPacket_PingPacket*(message: ServerPacket_PingPacket): uint64
proc toJson*(message: ServerPacket_PingPacket): JsonNode
proc parseServerPacket_PingPacket*(obj: JsonNode): ServerPacket_PingPacket

proc newClientPacket_PongPacket*(): ClientPacket_PongPacket
proc newClientPacket_PongPacket*(data: string): ClientPacket_PongPacket
proc newClientPacket_PongPacket*(data: seq[byte]): ClientPacket_PongPacket
proc writeClientPacket_PongPacket*(stream: Stream, message: ClientPacket_PongPacket)
proc readClientPacket_PongPacket*(stream: Stream): ClientPacket_PongPacket
proc sizeOfClientPacket_PongPacket*(message: ClientPacket_PongPacket): uint64
proc toJson*(message: ClientPacket_PongPacket): JsonNode
proc parseClientPacket_PongPacket*(obj: JsonNode): ClientPacket_PongPacket

proc newClientPacket_ClosePacket*(): ClientPacket_ClosePacket
proc newClientPacket_ClosePacket*(data: string): ClientPacket_ClosePacket
proc newClientPacket_ClosePacket*(data: seq[byte]): ClientPacket_ClosePacket
proc writeClientPacket_ClosePacket*(stream: Stream, message: ClientPacket_ClosePacket)
proc readClientPacket_ClosePacket*(stream: Stream): ClientPacket_ClosePacket
proc sizeOfClientPacket_ClosePacket*(message: ClientPacket_ClosePacket): uint64
proc toJson*(message: ClientPacket_ClosePacket): JsonNode
proc parseClientPacket_ClosePacket*(obj: JsonNode): ClientPacket_ClosePacket

proc newServerPacket*(): ServerPacket
proc newServerPacket*(data: string): ServerPacket
proc newServerPacket*(data: seq[byte]): ServerPacket
proc writeServerPacket*(stream: Stream, message: ServerPacket)
proc readServerPacket*(stream: Stream): ServerPacket
proc sizeOfServerPacket*(message: ServerPacket): uint64
proc toJson*(message: ServerPacket): JsonNode
proc parseServerPacket*(obj: JsonNode): ServerPacket

proc newClientPacket_CreateAccountPacket*(): ClientPacket_CreateAccountPacket
proc newClientPacket_CreateAccountPacket*(data: string): ClientPacket_CreateAccountPacket
proc newClientPacket_CreateAccountPacket*(data: seq[byte]): ClientPacket_CreateAccountPacket
proc writeClientPacket_CreateAccountPacket*(stream: Stream, message: ClientPacket_CreateAccountPacket)
proc readClientPacket_CreateAccountPacket*(stream: Stream): ClientPacket_CreateAccountPacket
proc sizeOfClientPacket_CreateAccountPacket*(message: ClientPacket_CreateAccountPacket): uint64
proc toJson*(message: ClientPacket_CreateAccountPacket): JsonNode
proc parseClientPacket_CreateAccountPacket*(obj: JsonNode): ClientPacket_CreateAccountPacket

proc newClientPacket_DummyPacket*(): ClientPacket_DummyPacket
proc newClientPacket_DummyPacket*(data: string): ClientPacket_DummyPacket
proc newClientPacket_DummyPacket*(data: seq[byte]): ClientPacket_DummyPacket
proc writeClientPacket_DummyPacket*(stream: Stream, message: ClientPacket_DummyPacket)
proc readClientPacket_DummyPacket*(stream: Stream): ClientPacket_DummyPacket
proc sizeOfClientPacket_DummyPacket*(message: ClientPacket_DummyPacket): uint64
proc toJson*(message: ClientPacket_DummyPacket): JsonNode
proc parseClientPacket_DummyPacket*(obj: JsonNode): ClientPacket_DummyPacket

proc newClientPacket*(): ClientPacket
proc newClientPacket*(data: string): ClientPacket
proc newClientPacket*(data: seq[byte]): ClientPacket
proc writeClientPacket*(stream: Stream, message: ClientPacket)
proc readClientPacket*(stream: Stream): ClientPacket
proc sizeOfClientPacket*(message: ClientPacket): uint64
proc toJson*(message: ClientPacket): JsonNode
proc parseClientPacket*(obj: JsonNode): ClientPacket

proc fullyQualifiedName*(T: typedesc[ServerPacket_ResponsePacket]): string = "ServerPacket.ResponsePacket"

proc readServerPacket_ResponsePacketImpl(stream: Stream): Message = readServerPacket_ResponsePacket(stream)
proc writeServerPacket_ResponsePacketImpl(stream: Stream, msg: Message) = writeServerPacket_ResponsePacket(stream, ServerPacket_ResponsePacket(msg))
proc toJsonServerPacket_ResponsePacketImpl(msg: Message): JsonNode = toJson(ServerPacket_ResponsePacket(msg))
proc fromJsonServerPacket_ResponsePacketImpl(node: JsonNode): Message = parseServerPacket_ResponsePacket(node)

proc ServerPacket_ResponsePacketProcs*(): MessageProcs =
    result.readImpl = readServerPacket_ResponsePacketImpl
    result.writeImpl = writeServerPacket_ResponsePacketImpl
    result.toJsonImpl = toJsonServerPacket_ResponsePacketImpl
    result.fromJsonImpl = fromJsonServerPacket_ResponsePacketImpl

proc newServerPacket_ResponsePacket*(): ServerPacket_ResponsePacket =
    new(result)
    initMessage(result[])
    result.procs = ServerPacket_ResponsePacketProcs()
    result.code = 0
    result.message = ""

proc clearcode*(message: ServerPacket_ResponsePacket) =
    message.code = 0

proc setcode*(message: ServerPacket_ResponsePacket, value: int32) =
    message.code = value

proc code*(message: ServerPacket_ResponsePacket): int32 {.inline.} =
    message.code

proc `code=`*(message: ServerPacket_ResponsePacket, value: int32) {.inline.} =
    setcode(message, value)

proc clearmessage*(message: ServerPacket_ResponsePacket) =
    message.message = ""

proc setmessage*(message: ServerPacket_ResponsePacket, value: string) =
    message.message = value

proc message*(message: ServerPacket_ResponsePacket): string {.inline.} =
    message.message

proc `message=`*(message: ServerPacket_ResponsePacket, value: string) {.inline.} =
    setmessage(message, value)

proc sizeOfServerPacket_ResponsePacket*(message: ServerPacket_ResponsePacket): uint64 =
    if message.code != 0:
        result = result + sizeOfTag(1, WireType.Varint)
        result = result + sizeOfInt32(message.code)
    if len(message.message) > 0:
        result = result + sizeOfTag(2, WireType.LengthDelimited)
        result = result + sizeOfString(message.message)
    result = result + sizeOfUnknownFields(message)

proc writeServerPacket_ResponsePacket*(stream: Stream, message: ServerPacket_ResponsePacket) =
    if message.code != 0:
        protoWriteInt32(stream, message.code, 1)
    if len(message.message) > 0:
        protoWriteString(stream, message.message, 2)
    writeUnknownFields(stream, message)

proc readServerPacket_ResponsePacket*(stream: Stream): ServerPacket_ResponsePacket =
    result = newServerPacket_ResponsePacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.Varint)
            setcode(result, protoReadInt32(stream))
        of 2:
            expectWireType(wireType, WireType.LengthDelimited)
            setmessage(result, protoReadString(stream))
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ServerPacket_ResponsePacket): JsonNode =
    result = newJObject()
    if message.code != 0:
        result["code"] = %message.code
    if len(message.message) > 0:
        result["message"] = %message.message

proc parseServerPacket_ResponsePacket*(obj: JsonNode): ServerPacket_ResponsePacket =
    result = newServerPacket_ResponsePacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")
    node = getJsonField(obj, "code", "code")
    if node != nil and node.kind != JNull:
        setcode(result, parseInt[int32](node))
    node = getJsonField(obj, "message", "message")
    if node != nil and node.kind != JNull:
        setmessage(result, parseString(node))

proc serialize*(message: ServerPacket_ResponsePacket): string =
    let
        ss = newStringStream()
    writeServerPacket_ResponsePacket(ss, message)
    result = ss.data

proc newServerPacket_ResponsePacket*(data: string): ServerPacket_ResponsePacket =
    let
        ss = newStringStream(data)
    result = readServerPacket_ResponsePacket(ss)

proc newServerPacket_ResponsePacket*(data: seq[byte]): ServerPacket_ResponsePacket =
    let
        ss = newStringStream(cast[string](data))
    result = readServerPacket_ResponsePacket(ss)


proc fullyQualifiedName*(T: typedesc[ClientPacket_LoginPacket]): string = "ClientPacket.LoginPacket"

proc readClientPacket_LoginPacketImpl(stream: Stream): Message = readClientPacket_LoginPacket(stream)
proc writeClientPacket_LoginPacketImpl(stream: Stream, msg: Message) = writeClientPacket_LoginPacket(stream, ClientPacket_LoginPacket(msg))
proc toJsonClientPacket_LoginPacketImpl(msg: Message): JsonNode = toJson(ClientPacket_LoginPacket(msg))
proc fromJsonClientPacket_LoginPacketImpl(node: JsonNode): Message = parseClientPacket_LoginPacket(node)

proc ClientPacket_LoginPacketProcs*(): MessageProcs =
    result.readImpl = readClientPacket_LoginPacketImpl
    result.writeImpl = writeClientPacket_LoginPacketImpl
    result.toJsonImpl = toJsonClientPacket_LoginPacketImpl
    result.fromJsonImpl = fromJsonClientPacket_LoginPacketImpl

proc newClientPacket_LoginPacket*(): ClientPacket_LoginPacket =
    new(result)
    initMessage(result[])
    result.procs = ClientPacket_LoginPacketProcs()
    result.email = ""
    result.password = ""

proc clearemail*(message: ClientPacket_LoginPacket) =
    message.email = ""

proc setemail*(message: ClientPacket_LoginPacket, value: string) =
    message.email = value

proc email*(message: ClientPacket_LoginPacket): string {.inline.} =
    message.email

proc `email=`*(message: ClientPacket_LoginPacket, value: string) {.inline.} =
    setemail(message, value)

proc clearpassword*(message: ClientPacket_LoginPacket) =
    message.password = ""

proc setpassword*(message: ClientPacket_LoginPacket, value: string) =
    message.password = value

proc password*(message: ClientPacket_LoginPacket): string {.inline.} =
    message.password

proc `password=`*(message: ClientPacket_LoginPacket, value: string) {.inline.} =
    setpassword(message, value)

proc sizeOfClientPacket_LoginPacket*(message: ClientPacket_LoginPacket): uint64 =
    if len(message.email) > 0:
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfString(message.email)
    if len(message.password) > 0:
        result = result + sizeOfTag(2, WireType.LengthDelimited)
        result = result + sizeOfString(message.password)
    result = result + sizeOfUnknownFields(message)

proc writeClientPacket_LoginPacket*(stream: Stream, message: ClientPacket_LoginPacket) =
    if len(message.email) > 0:
        protoWriteString(stream, message.email, 1)
    if len(message.password) > 0:
        protoWriteString(stream, message.password, 2)
    writeUnknownFields(stream, message)

proc readClientPacket_LoginPacket*(stream: Stream): ClientPacket_LoginPacket =
    result = newClientPacket_LoginPacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            setemail(result, protoReadString(stream))
        of 2:
            expectWireType(wireType, WireType.LengthDelimited)
            setpassword(result, protoReadString(stream))
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ClientPacket_LoginPacket): JsonNode =
    result = newJObject()
    if len(message.email) > 0:
        result["email"] = %message.email
    if len(message.password) > 0:
        result["password"] = %message.password

proc parseClientPacket_LoginPacket*(obj: JsonNode): ClientPacket_LoginPacket =
    result = newClientPacket_LoginPacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")
    node = getJsonField(obj, "email", "email")
    if node != nil and node.kind != JNull:
        setemail(result, parseString(node))
    node = getJsonField(obj, "password", "password")
    if node != nil and node.kind != JNull:
        setpassword(result, parseString(node))

proc serialize*(message: ClientPacket_LoginPacket): string =
    let
        ss = newStringStream()
    writeClientPacket_LoginPacket(ss, message)
    result = ss.data

proc newClientPacket_LoginPacket*(data: string): ClientPacket_LoginPacket =
    let
        ss = newStringStream(data)
    result = readClientPacket_LoginPacket(ss)

proc newClientPacket_LoginPacket*(data: seq[byte]): ClientPacket_LoginPacket =
    let
        ss = newStringStream(cast[string](data))
    result = readClientPacket_LoginPacket(ss)


proc fullyQualifiedName*(T: typedesc[ServerPacket_PingPacket]): string = "ServerPacket.PingPacket"

proc readServerPacket_PingPacketImpl(stream: Stream): Message = readServerPacket_PingPacket(stream)
proc writeServerPacket_PingPacketImpl(stream: Stream, msg: Message) = writeServerPacket_PingPacket(stream, ServerPacket_PingPacket(msg))
proc toJsonServerPacket_PingPacketImpl(msg: Message): JsonNode = toJson(ServerPacket_PingPacket(msg))
proc fromJsonServerPacket_PingPacketImpl(node: JsonNode): Message = parseServerPacket_PingPacket(node)

proc ServerPacket_PingPacketProcs*(): MessageProcs =
    result.readImpl = readServerPacket_PingPacketImpl
    result.writeImpl = writeServerPacket_PingPacketImpl
    result.toJsonImpl = toJsonServerPacket_PingPacketImpl
    result.fromJsonImpl = fromJsonServerPacket_PingPacketImpl

proc newServerPacket_PingPacket*(): ServerPacket_PingPacket =
    new(result)
    initMessage(result[])
    result.procs = ServerPacket_PingPacketProcs()

proc sizeOfServerPacket_PingPacket*(message: ServerPacket_PingPacket): uint64 =
    result = result + sizeOfUnknownFields(message)

proc writeServerPacket_PingPacket*(stream: Stream, message: ServerPacket_PingPacket) =
    writeUnknownFields(stream, message)

proc readServerPacket_PingPacket*(stream: Stream): ServerPacket_PingPacket =
    result = newServerPacket_PingPacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ServerPacket_PingPacket): JsonNode =
    result = newJObject()

proc parseServerPacket_PingPacket*(obj: JsonNode): ServerPacket_PingPacket =
    result = newServerPacket_PingPacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")

proc serialize*(message: ServerPacket_PingPacket): string =
    let
        ss = newStringStream()
    writeServerPacket_PingPacket(ss, message)
    result = ss.data

proc newServerPacket_PingPacket*(data: string): ServerPacket_PingPacket =
    let
        ss = newStringStream(data)
    result = readServerPacket_PingPacket(ss)

proc newServerPacket_PingPacket*(data: seq[byte]): ServerPacket_PingPacket =
    let
        ss = newStringStream(cast[string](data))
    result = readServerPacket_PingPacket(ss)


proc fullyQualifiedName*(T: typedesc[ClientPacket_PongPacket]): string = "ClientPacket.PongPacket"

proc readClientPacket_PongPacketImpl(stream: Stream): Message = readClientPacket_PongPacket(stream)
proc writeClientPacket_PongPacketImpl(stream: Stream, msg: Message) = writeClientPacket_PongPacket(stream, ClientPacket_PongPacket(msg))
proc toJsonClientPacket_PongPacketImpl(msg: Message): JsonNode = toJson(ClientPacket_PongPacket(msg))
proc fromJsonClientPacket_PongPacketImpl(node: JsonNode): Message = parseClientPacket_PongPacket(node)

proc ClientPacket_PongPacketProcs*(): MessageProcs =
    result.readImpl = readClientPacket_PongPacketImpl
    result.writeImpl = writeClientPacket_PongPacketImpl
    result.toJsonImpl = toJsonClientPacket_PongPacketImpl
    result.fromJsonImpl = fromJsonClientPacket_PongPacketImpl

proc newClientPacket_PongPacket*(): ClientPacket_PongPacket =
    new(result)
    initMessage(result[])
    result.procs = ClientPacket_PongPacketProcs()

proc sizeOfClientPacket_PongPacket*(message: ClientPacket_PongPacket): uint64 =
    result = result + sizeOfUnknownFields(message)

proc writeClientPacket_PongPacket*(stream: Stream, message: ClientPacket_PongPacket) =
    writeUnknownFields(stream, message)

proc readClientPacket_PongPacket*(stream: Stream): ClientPacket_PongPacket =
    result = newClientPacket_PongPacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ClientPacket_PongPacket): JsonNode =
    result = newJObject()

proc parseClientPacket_PongPacket*(obj: JsonNode): ClientPacket_PongPacket =
    result = newClientPacket_PongPacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")

proc serialize*(message: ClientPacket_PongPacket): string =
    let
        ss = newStringStream()
    writeClientPacket_PongPacket(ss, message)
    result = ss.data

proc newClientPacket_PongPacket*(data: string): ClientPacket_PongPacket =
    let
        ss = newStringStream(data)
    result = readClientPacket_PongPacket(ss)

proc newClientPacket_PongPacket*(data: seq[byte]): ClientPacket_PongPacket =
    let
        ss = newStringStream(cast[string](data))
    result = readClientPacket_PongPacket(ss)


proc fullyQualifiedName*(T: typedesc[ClientPacket_ClosePacket]): string = "ClientPacket.ClosePacket"

proc readClientPacket_ClosePacketImpl(stream: Stream): Message = readClientPacket_ClosePacket(stream)
proc writeClientPacket_ClosePacketImpl(stream: Stream, msg: Message) = writeClientPacket_ClosePacket(stream, ClientPacket_ClosePacket(msg))
proc toJsonClientPacket_ClosePacketImpl(msg: Message): JsonNode = toJson(ClientPacket_ClosePacket(msg))
proc fromJsonClientPacket_ClosePacketImpl(node: JsonNode): Message = parseClientPacket_ClosePacket(node)

proc ClientPacket_ClosePacketProcs*(): MessageProcs =
    result.readImpl = readClientPacket_ClosePacketImpl
    result.writeImpl = writeClientPacket_ClosePacketImpl
    result.toJsonImpl = toJsonClientPacket_ClosePacketImpl
    result.fromJsonImpl = fromJsonClientPacket_ClosePacketImpl

proc newClientPacket_ClosePacket*(): ClientPacket_ClosePacket =
    new(result)
    initMessage(result[])
    result.procs = ClientPacket_ClosePacketProcs()

proc sizeOfClientPacket_ClosePacket*(message: ClientPacket_ClosePacket): uint64 =
    result = result + sizeOfUnknownFields(message)

proc writeClientPacket_ClosePacket*(stream: Stream, message: ClientPacket_ClosePacket) =
    writeUnknownFields(stream, message)

proc readClientPacket_ClosePacket*(stream: Stream): ClientPacket_ClosePacket =
    result = newClientPacket_ClosePacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ClientPacket_ClosePacket): JsonNode =
    result = newJObject()

proc parseClientPacket_ClosePacket*(obj: JsonNode): ClientPacket_ClosePacket =
    result = newClientPacket_ClosePacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")

proc serialize*(message: ClientPacket_ClosePacket): string =
    let
        ss = newStringStream()
    writeClientPacket_ClosePacket(ss, message)
    result = ss.data

proc newClientPacket_ClosePacket*(data: string): ClientPacket_ClosePacket =
    let
        ss = newStringStream(data)
    result = readClientPacket_ClosePacket(ss)

proc newClientPacket_ClosePacket*(data: seq[byte]): ClientPacket_ClosePacket =
    let
        ss = newStringStream(cast[string](data))
    result = readClientPacket_ClosePacket(ss)


proc fullyQualifiedName*(T: typedesc[ServerPacket]): string = "ServerPacket"

proc readServerPacketImpl(stream: Stream): Message = readServerPacket(stream)
proc writeServerPacketImpl(stream: Stream, msg: Message) = writeServerPacket(stream, ServerPacket(msg))
proc toJsonServerPacketImpl(msg: Message): JsonNode = toJson(ServerPacket(msg))
proc fromJsonServerPacketImpl(node: JsonNode): Message = parseServerPacket(node)

proc ServerPacketProcs*(): MessageProcs =
    result.readImpl = readServerPacketImpl
    result.writeImpl = writeServerPacketImpl
    result.toJsonImpl = toJsonServerPacketImpl
    result.fromJsonImpl = fromJsonServerPacketImpl

proc newServerPacket*(): ServerPacket =
    new(result)
    initMessage(result[])
    result.procs = ServerPacketProcs()

proc sizeOfServerPacket*(message: ServerPacket): uint64 =
    result = result + sizeOfUnknownFields(message)

proc writeServerPacket*(stream: Stream, message: ServerPacket) =
    writeUnknownFields(stream, message)

proc readServerPacket*(stream: Stream): ServerPacket =
    result = newServerPacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ServerPacket): JsonNode =
    result = newJObject()

proc parseServerPacket*(obj: JsonNode): ServerPacket =
    result = newServerPacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")

proc serialize*(message: ServerPacket): string =
    let
        ss = newStringStream()
    writeServerPacket(ss, message)
    result = ss.data

proc newServerPacket*(data: string): ServerPacket =
    let
        ss = newStringStream(data)
    result = readServerPacket(ss)

proc newServerPacket*(data: seq[byte]): ServerPacket =
    let
        ss = newStringStream(cast[string](data))
    result = readServerPacket(ss)


proc fullyQualifiedName*(T: typedesc[ClientPacket_CreateAccountPacket]): string = "ClientPacket.CreateAccountPacket"

proc readClientPacket_CreateAccountPacketImpl(stream: Stream): Message = readClientPacket_CreateAccountPacket(stream)
proc writeClientPacket_CreateAccountPacketImpl(stream: Stream, msg: Message) = writeClientPacket_CreateAccountPacket(stream, ClientPacket_CreateAccountPacket(msg))
proc toJsonClientPacket_CreateAccountPacketImpl(msg: Message): JsonNode = toJson(ClientPacket_CreateAccountPacket(msg))
proc fromJsonClientPacket_CreateAccountPacketImpl(node: JsonNode): Message = parseClientPacket_CreateAccountPacket(node)

proc ClientPacket_CreateAccountPacketProcs*(): MessageProcs =
    result.readImpl = readClientPacket_CreateAccountPacketImpl
    result.writeImpl = writeClientPacket_CreateAccountPacketImpl
    result.toJsonImpl = toJsonClientPacket_CreateAccountPacketImpl
    result.fromJsonImpl = fromJsonClientPacket_CreateAccountPacketImpl

proc newClientPacket_CreateAccountPacket*(): ClientPacket_CreateAccountPacket =
    new(result)
    initMessage(result[])
    result.procs = ClientPacket_CreateAccountPacketProcs()
    result.email = ""
    result.username = ""
    result.password = ""

proc clearemail*(message: ClientPacket_CreateAccountPacket) =
    message.email = ""

proc setemail*(message: ClientPacket_CreateAccountPacket, value: string) =
    message.email = value

proc email*(message: ClientPacket_CreateAccountPacket): string {.inline.} =
    message.email

proc `email=`*(message: ClientPacket_CreateAccountPacket, value: string) {.inline.} =
    setemail(message, value)

proc clearusername*(message: ClientPacket_CreateAccountPacket) =
    message.username = ""

proc setusername*(message: ClientPacket_CreateAccountPacket, value: string) =
    message.username = value

proc username*(message: ClientPacket_CreateAccountPacket): string {.inline.} =
    message.username

proc `username=`*(message: ClientPacket_CreateAccountPacket, value: string) {.inline.} =
    setusername(message, value)

proc clearpassword*(message: ClientPacket_CreateAccountPacket) =
    message.password = ""

proc setpassword*(message: ClientPacket_CreateAccountPacket, value: string) =
    message.password = value

proc password*(message: ClientPacket_CreateAccountPacket): string {.inline.} =
    message.password

proc `password=`*(message: ClientPacket_CreateAccountPacket, value: string) {.inline.} =
    setpassword(message, value)

proc sizeOfClientPacket_CreateAccountPacket*(message: ClientPacket_CreateAccountPacket): uint64 =
    if len(message.email) > 0:
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfString(message.email)
    if len(message.username) > 0:
        result = result + sizeOfTag(2, WireType.LengthDelimited)
        result = result + sizeOfString(message.username)
    if len(message.password) > 0:
        result = result + sizeOfTag(3, WireType.LengthDelimited)
        result = result + sizeOfString(message.password)
    result = result + sizeOfUnknownFields(message)

proc writeClientPacket_CreateAccountPacket*(stream: Stream, message: ClientPacket_CreateAccountPacket) =
    if len(message.email) > 0:
        protoWriteString(stream, message.email, 1)
    if len(message.username) > 0:
        protoWriteString(stream, message.username, 2)
    if len(message.password) > 0:
        protoWriteString(stream, message.password, 3)
    writeUnknownFields(stream, message)

proc readClientPacket_CreateAccountPacket*(stream: Stream): ClientPacket_CreateAccountPacket =
    result = newClientPacket_CreateAccountPacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            setemail(result, protoReadString(stream))
        of 2:
            expectWireType(wireType, WireType.LengthDelimited)
            setusername(result, protoReadString(stream))
        of 3:
            expectWireType(wireType, WireType.LengthDelimited)
            setpassword(result, protoReadString(stream))
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ClientPacket_CreateAccountPacket): JsonNode =
    result = newJObject()
    if len(message.email) > 0:
        result["email"] = %message.email
    if len(message.username) > 0:
        result["username"] = %message.username
    if len(message.password) > 0:
        result["password"] = %message.password

proc parseClientPacket_CreateAccountPacket*(obj: JsonNode): ClientPacket_CreateAccountPacket =
    result = newClientPacket_CreateAccountPacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")
    node = getJsonField(obj, "email", "email")
    if node != nil and node.kind != JNull:
        setemail(result, parseString(node))
    node = getJsonField(obj, "username", "username")
    if node != nil and node.kind != JNull:
        setusername(result, parseString(node))
    node = getJsonField(obj, "password", "password")
    if node != nil and node.kind != JNull:
        setpassword(result, parseString(node))

proc serialize*(message: ClientPacket_CreateAccountPacket): string =
    let
        ss = newStringStream()
    writeClientPacket_CreateAccountPacket(ss, message)
    result = ss.data

proc newClientPacket_CreateAccountPacket*(data: string): ClientPacket_CreateAccountPacket =
    let
        ss = newStringStream(data)
    result = readClientPacket_CreateAccountPacket(ss)

proc newClientPacket_CreateAccountPacket*(data: seq[byte]): ClientPacket_CreateAccountPacket =
    let
        ss = newStringStream(cast[string](data))
    result = readClientPacket_CreateAccountPacket(ss)


proc fullyQualifiedName*(T: typedesc[ClientPacket_DummyPacket]): string = "ClientPacket.DummyPacket"

proc readClientPacket_DummyPacketImpl(stream: Stream): Message = readClientPacket_DummyPacket(stream)
proc writeClientPacket_DummyPacketImpl(stream: Stream, msg: Message) = writeClientPacket_DummyPacket(stream, ClientPacket_DummyPacket(msg))
proc toJsonClientPacket_DummyPacketImpl(msg: Message): JsonNode = toJson(ClientPacket_DummyPacket(msg))
proc fromJsonClientPacket_DummyPacketImpl(node: JsonNode): Message = parseClientPacket_DummyPacket(node)

proc ClientPacket_DummyPacketProcs*(): MessageProcs =
    result.readImpl = readClientPacket_DummyPacketImpl
    result.writeImpl = writeClientPacket_DummyPacketImpl
    result.toJsonImpl = toJsonClientPacket_DummyPacketImpl
    result.fromJsonImpl = fromJsonClientPacket_DummyPacketImpl

proc newClientPacket_DummyPacket*(): ClientPacket_DummyPacket =
    new(result)
    initMessage(result[])
    result.procs = ClientPacket_DummyPacketProcs()
    result.email = ""
    result.password = ""

proc clearemail*(message: ClientPacket_DummyPacket) =
    message.email = ""

proc setemail*(message: ClientPacket_DummyPacket, value: string) =
    message.email = value

proc email*(message: ClientPacket_DummyPacket): string {.inline.} =
    message.email

proc `email=`*(message: ClientPacket_DummyPacket, value: string) {.inline.} =
    setemail(message, value)

proc clearpassword*(message: ClientPacket_DummyPacket) =
    message.password = ""

proc setpassword*(message: ClientPacket_DummyPacket, value: string) =
    message.password = value

proc password*(message: ClientPacket_DummyPacket): string {.inline.} =
    message.password

proc `password=`*(message: ClientPacket_DummyPacket, value: string) {.inline.} =
    setpassword(message, value)

proc sizeOfClientPacket_DummyPacket*(message: ClientPacket_DummyPacket): uint64 =
    if len(message.email) > 0:
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfString(message.email)
    if len(message.password) > 0:
        result = result + sizeOfTag(2, WireType.LengthDelimited)
        result = result + sizeOfString(message.password)
    result = result + sizeOfUnknownFields(message)

proc writeClientPacket_DummyPacket*(stream: Stream, message: ClientPacket_DummyPacket) =
    if len(message.email) > 0:
        protoWriteString(stream, message.email, 1)
    if len(message.password) > 0:
        protoWriteString(stream, message.password, 2)
    writeUnknownFields(stream, message)

proc readClientPacket_DummyPacket*(stream: Stream): ClientPacket_DummyPacket =
    result = newClientPacket_DummyPacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            setemail(result, protoReadString(stream))
        of 2:
            expectWireType(wireType, WireType.LengthDelimited)
            setpassword(result, protoReadString(stream))
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ClientPacket_DummyPacket): JsonNode =
    result = newJObject()
    if len(message.email) > 0:
        result["email"] = %message.email
    if len(message.password) > 0:
        result["password"] = %message.password

proc parseClientPacket_DummyPacket*(obj: JsonNode): ClientPacket_DummyPacket =
    result = newClientPacket_DummyPacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")
    node = getJsonField(obj, "email", "email")
    if node != nil and node.kind != JNull:
        setemail(result, parseString(node))
    node = getJsonField(obj, "password", "password")
    if node != nil and node.kind != JNull:
        setpassword(result, parseString(node))

proc serialize*(message: ClientPacket_DummyPacket): string =
    let
        ss = newStringStream()
    writeClientPacket_DummyPacket(ss, message)
    result = ss.data

proc newClientPacket_DummyPacket*(data: string): ClientPacket_DummyPacket =
    let
        ss = newStringStream(data)
    result = readClientPacket_DummyPacket(ss)

proc newClientPacket_DummyPacket*(data: seq[byte]): ClientPacket_DummyPacket =
    let
        ss = newStringStream(cast[string](data))
    result = readClientPacket_DummyPacket(ss)


proc fullyQualifiedName*(T: typedesc[ClientPacket]): string = "ClientPacket"

proc readClientPacketImpl(stream: Stream): Message = readClientPacket(stream)
proc writeClientPacketImpl(stream: Stream, msg: Message) = writeClientPacket(stream, ClientPacket(msg))
proc toJsonClientPacketImpl(msg: Message): JsonNode = toJson(ClientPacket(msg))
proc fromJsonClientPacketImpl(node: JsonNode): Message = parseClientPacket(node)

proc ClientPacketProcs*(): MessageProcs =
    result.readImpl = readClientPacketImpl
    result.writeImpl = writeClientPacketImpl
    result.toJsonImpl = toJsonClientPacketImpl
    result.fromJsonImpl = fromJsonClientPacketImpl

proc newClientPacket*(): ClientPacket =
    new(result)
    initMessage(result[])
    result.procs = ClientPacketProcs()

proc sizeOfClientPacket*(message: ClientPacket): uint64 =
    result = result + sizeOfUnknownFields(message)

proc writeClientPacket*(stream: Stream, message: ClientPacket) =
    writeUnknownFields(stream, message)

proc readClientPacket*(stream: Stream): ClientPacket =
    result = newClientPacket()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        else: readUnknownField(stream, result, tag)

proc toJson*(message: ClientPacket): JsonNode =
    result = newJObject()

proc parseClientPacket*(obj: JsonNode): ClientPacket =
    result = newClientPacket()
    var node: JsonNode
    if obj.kind != JObject:
        raise newException(nimpb_json.ParseError, "object expected")

proc serialize*(message: ClientPacket): string =
    let
        ss = newStringStream()
    writeClientPacket(ss, message)
    result = ss.data

proc newClientPacket*(data: string): ClientPacket =
    let
        ss = newStringStream(data)
    result = readClientPacket(ss)

proc newClientPacket*(data: seq[byte]): ClientPacket =
    let
        ss = newStringStream(cast[string](data))
    result = readClientPacket(ss)


