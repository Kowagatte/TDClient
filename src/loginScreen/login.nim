import ../connection
import ../packets_pb
import godot
import godotinternal
import godotapi/[engine, node, line_edit, button]

gdobj Login of Node:

  var
    emailEnter: LineEdit
    passwordEnter: LineEdit
    loginButton: Button

  method ready*() =
    self.emailEnter = self.getNode(newNodePath("Email/EmailEnter")) as LineEdit
    self.passwordEnter = self.getNode(newNodePath("Password/PasswordEnter")) as LineEdit
    self.loginButton = self.getNode(newNodePath("LoginButton")) as Button
    discard self.loginButton.connect("pressed", self, "_send_credentials")

  method sendCredentials() =
    var loginPacket: ClientPacket_LoginPacket = newClientPacket_LoginPacket()
    loginPacket.email = self.emailEnter.text
    loginPacket.password = self.passwordEnter.text
    sendData(serialize(loginPacket))

  method debugLoginCredentials*() =
    print("Email:", self.emailEnter.text)
    print("Password:", self.passwordEnter.text)
