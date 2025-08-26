import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "search"

  static values = {
    items: Array,
    resource: String,
    icon: String
  }

  connect() {
    super.connect()
    console.log("Search Component Connected"); 
    this.#populateList(this.itemsValue)

    this.send("connect", {}, (message) => {
      const query = message.data.query
      const items = this.itemsValue.filter(item =>
        item.name.toLowerCase().includes(query.toLowerCase())
      )
      this.#populateList(items)
    })
  }

  // An example search function.
  // Replace with your own implementation or call out to an external API.
  #populateList(items) {
    console.log("#populateList called with following items", items);
    this.element.innerHTML = ""

    items.forEach(item => {
      const link = document.createElement("a")
      link.href = `/${this.resourceValue}/${encodeURIComponent(item.id)}`
      link.className = "list-group-item list-group-item-action";
      link.innerHTML = this.iconValue ? `${this.iconValue} ${item.name}` : item.name;
      this.element.appendChild(link);
    })
  }
}