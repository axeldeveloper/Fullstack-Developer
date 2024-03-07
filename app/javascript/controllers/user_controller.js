//import { Controller } from "stimulus"
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    static targets = ["usersList"]

    connect() {
        console.log("chamando api");
        this.loadUsers()
    }

    loadUsers1() {
        fetch("/api/v1/users")
            .then(response => response.json())
            .then(data => {
                this.listItemTargets.forEach(element => {
                    element.innerHTML = data.map(user => `<li>${user.full_name}</li>`).join("")
                })
            })
    }

    loadUsers() {
        fetch("/api/v1/users")
            .then(response => response.json())
            .then(data => {
                this.usersListTarget.innerHTML = ""
                data.forEach(user => {
                    this.usersListTarget.innerHTML += `
                        <tr>
                          <td>${user.full_name}</td>
                          <td>${user.email}</td>
                          <!-- Adicione mais colunas conforme necessário -->
                        </tr>
                      `
                })
            })
    }
}