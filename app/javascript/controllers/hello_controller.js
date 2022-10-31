import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    async runQuery(url = '', data = {}) {
	const csrfToken = document.querySelector("[name='csrf-token']").content
	var response = await fetch(url, {
	    method: 'POST',
	    headers: {
		'X-CSRF-Token': csrfToken,
		'Content-Type': 'application/json'
	    },
	    body: JSON.stringify({query: this.query()})
	});
	return response.json();
    }

    query() {
	return `
query {
  customer(customerId: 1) {
    firstName
    lastName
    rentals {
      rentalDate
      returnDate
      film {
        title
        releaseYear
        rating
        actors {
          firstName
          lastName
        }
      }
    }
  }
}
        `;
    }

    connect() {
	this.element.textContent = "Loading...";
	this.runQuery('/graphql', this.query())
	    .then((data) => {
		console.log(data);
		var customer = data.data.customer;
		var elt = document.getElementById('customer-placeholder');
		var custElement = document.createElement('h2');
		var textContent = document.createTextNode(customer.firstName + ' ' + customer.lastName);
		custElement.appendChild(textContent);
		elt.appendChild(custElement);

		this.element.textContent = '';
	    });
    }
}
