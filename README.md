# blackgirl.tech

## Roadmap

- [ ] Write subscription library class to wrap up GoCardless
- [ ] Set up devise user authentication
- [ ] Save subscription information in `Subscription` model which `belongs_to :user` during registration
- [ ] Integrate subscription library with registration
- [ ] Write mailing list library to wrap up MailChimp
- [ ] Integrate mailing list library with registration

## Models

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
