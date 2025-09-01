import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "notification_token"
  connect() {
    super.connect()
    this.send("connect")
  }
}
