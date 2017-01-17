# blackgirl.tech

## Roadmap

- [ ] Write subscription library class to wrap up GoCardless
- [ ] Set up devise user authentication
- [ ] Save subscription information in `Subscription` model which `belongs_to :user` during registration
- [ ] Integrate subscription library with registration
- [ ] Write mailing list library to wrap up MailChimp
- [ ] Integrate mailing list library with registration

## Models

### Users
- [x] Set up devise for users
- [ ] Style sign up/in forms
- [ ] Create user account page
- [ ] Create admin_user account page (can create events, can see list of volunteers per event, can see all volunteers)
- [ ] Create volunteer account page (can see past events volunteered at & upcoming events volunteered for)

### Subscription
- [ ] Submit :type with user sign_up

### Events
- [ ] Allow users to volunteer for event
- [ ] Allow users to attend event (future)
- [ ] Allow users to pay deposit for event (future)

```
User
  #id
  has_one :subscription
  
Subscription
  #id
  #user_id
  #type ("free", "paid", "ally")
  belongs_to :user
```

```
  Event
    has_one :event_user

  EventUser
    belongs_to :event
    belongs_to :user

  User
    has_one :event_user
```