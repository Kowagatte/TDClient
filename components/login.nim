import ../non_components / [packets]
import gdnim, godotapi / [engine, node, line_edit, button, input, global_constants, link_button, scene_tree]
import connection

gdnim Login of Node:

  var
    emailEnter: LineEdit
    passwordEnter: LineEdit
    loginButton: Button
    createAccountButton: LinkButton
    connection: Connection

  method ready() =
    self.connection = self.get_node("/root/Connection") as Connection
    self.emailEnter = self.getNode(newNodePath("Email/EmailEnter")) as LineEdit
    self.passwordEnter = self.getNode(newNodePath("Password/PasswordEnter")) as LineEdit
    self.loginButton = self.getNode(newNodePath("LoginButton")) as Button
    self.createAccountButton = self.getNode(newNodePath("CreateAccount/CreateAccountButton")) as LinkButton
    discard self.loginButton.connect("pressed", self, "_send_credentials")
    discard self.createAccountButton.connect("pressed", self, "_create_account")

  method sendCredentials() =
    var loginPacket: ClientPacket_LoginPacket = newClientPacket_LoginPacket()
    loginPacket.email = self.emailEnter.text
    loginPacket.password = self.passwordEnter.text
    self.connection.sendData(construct(loginPacket))

  method input(event: InputEvent) =
    if isKeyPressed(KEY_T):
      let pack = self.connection.receiveMessage()
      if pack of ServerPacket_ResponsePacket:
        let resp = ServerPacket_ResponsePacket pack
        echo resp.code
        echo resp.message
      #echo serialize(receiveMessage())
      #print(serialize(receiveMessage()))

  method debugLoginCredentials*() =
    print("Email:", self.emailEnter.text)
    print("Password:", self.passwordEnter.text)

  method createAccount*() =
    discard self.getTree().changeSceneImpl("res://scenes/CreateAccountScreen.tscn")
