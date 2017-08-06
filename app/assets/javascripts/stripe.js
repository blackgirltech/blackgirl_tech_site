function initialiseStripe(stripe_env, form_id) {
  var stripe = Stripe(stripe_env);
  var elements = stripe.elements();

  // Custom styling can be passed to options when creating an Element.
  var style = {
    base: {
      // Add your base input styles here. For example:
      fontSize: '16px',
      lineHeight: '24px'
    }
  };

  // Create an instance of the card Element
  var card = elements.create('card', {hidePostalCode: true}, {style: style});

  // Add an instance of the card Element into the `card-element` <div>
  card.mount('#card-element');

  card.addEventListener('change', function(event) {
    var displayError = document.getElementById('card-errors');
    if (event.error) {
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
    }
  });

  // Create a token or display an error when the form is submitted.
  var form = document.getElementById(form_id);
  form.addEventListener('submit', function(event) {
    event.preventDefault();

    stripe.createSource(card).then(function(result) {
      if (result.error) {
        // Inform the user if there was an error
        var errorElement = document.getElementById('card-errors');
        errorElement.textContent = result.error.message;
      } else {
        // Send the source to your server
        stripeSourceHandler(result.source);
      }
    });
  });

  function stripeSourceHandler(source) {
    // Insert the token ID into the form so it gets submitted to the server
    var form = document.getElementById(form_id);
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripe_source');
    hiddenInput.setAttribute('value', source.id);

    form.appendChild(hiddenInput);

    // Submit the form
    form.submit();
  }
}

function initialiseStripeDonation(stripe_env, form_id) {
  var stripe = Stripe(stripe_env);
  var elements = stripe.elements();

  // Custom styling can be passed to options when creating an Element.
  var style = {
    base: {
      // Add your base input styles here. For example:
      fontSize: '16px',
      lineHeight: '24px'
    }
  };

  // Create an instance of the card Element
  var card = elements.create('card', {hidePostalCode: true}, {style: style});

  // Add an instance of the card Element into the `card-element` <div>
  card.mount('#card-element');

  card.addEventListener('change', function(event) {
    var displayError = document.getElementById('card-errors');
    if (event.error) {
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
    }
  });

  // Create a token or display an error when the form is submitted.
  var form = document.getElementById(form_id);
  form.addEventListener('submit', function(event) {
    event.preventDefault();

    stripe.createToken(card).then(function(result) {
      if (result.error) {
        // Inform the user if there was an error
        var errorElement = document.getElementById('card-errors');
        errorElement.textContent = result.error.message;
      } else {
        // Send the token to your server
        stripeTokenHandler(result.token);
      }
    });
  });

  function stripeTokenHandler(token) {
    // Insert the token ID into the form so it gets submitted to the server
    var form = document.getElementById(form_id);
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripe_token');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    // Submit the form
    form.submit();
  }
}
