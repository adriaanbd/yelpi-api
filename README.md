# Yelpi API

> A Rails API to a healthcare app wherein a caretaker can register patients they care for, along with their health data inputs, i.e. medication, blood pressure, mental state, physical state, and medical condition, among others, and share the patient profile with an observer.

![Entity Relationship Diagram](/screenshots/erd.png?raw=true)

## Built With

- Rails 5
- JSON views with JBuilder
- Authentication with JWT
- Authorization with Pundit
- Database with PostgreSQL
- Testing with RSpec

## Live API

The API has been deployed on a free tier of a Heroku instance and can be accessed by using the following link: https://shrouded-ridge-16947.herokuapp.com/.

Please note that, since it is on a free tier, requests could take a bit more time longerthan usual.

## Getting started

### Clone it

`$ git clone https://github.com/adriaanbd/yelpi-api.git`

### Install dependencies

`$ bundle install`

### Setup the database

`$ rails db:setup`

### Migrate

`$ rails db:migrate`

### Run the development server

`$ rails s`

## Endpoints

|Purpose|Endpoint|Method|URL Params|Data Params
|--|--|--|--|--
|Create User|`/v1/users`|`POST`|email, given_name, last_name, password, password_confirmation
|Login User|`/v1/sessions/`|`POST`|email, password
|Show User|`/v1/users/:id`|`GET`|id|token
|Delete User|`/v1/users/:id`|`POST`|id|token
|Update User|`/v1/users/:id`|`PATCH`|id|token
|Create Patient|`v1/patients`|`POST`|given_name, last_name, birthdate, gender, relationship|registrant_id, token
|Update Patient|`v1/patients/:id`|`PATCH`|id|token
|List Patients|`v1/patients/:id`|`GET`|id|registrant_id, token
|Delete Patient|`v1/patients/:id`|`DELETE`|id|registrant_id, token
|Create Vital|`v1/patients/:patient_id/vitals`|`POST`|patient_id, weight, systolic, diastolic, temperature, mental condition, physical_health, locomotive|registrant_id, token
|Show Vital|`v1/patients/:patient_id/vitals/:id`|`POST`|patient_id, weight, systolic, diastolic, temperature, mental condition, physical_health, locomotive|registrant_id, token
|List Vitals|`v1/patients/:patient_id/vitals`|`GET`|patient_id|registrant_id, token
|Update Vital|`v1/patients/:patient_id/vitals/:id`|`PATCH`|patient_id, id, `vital[key]=value`|registrant_id, token
|Delete Vital|`v1/patients/:patient_id/vitals/:id`|`DELETE`|patient_id, id|registrant_id, token
|Create Medication|`v1/patients/:patient_id/medications`|`POST`|patient_id, name, frequency, duration, dosage, time, date, forma|registrant_id, token
|Show Medication|`v1/patients/:patient_id/medications/:id`|`GET`|patient_id, medication_id|registrant_id, token
|List Medications|`v1/patients/:patient_id/medications/`|`GET`|patient_id|registrant_id, token
|Update Medication|`v1/patients/:patient_id/medications/:id`|`PATCH`|patient_id. medication_id, `medication[key]=value`|registrant_id, token
|Delete Medication|`v1/patients/:patient_id/medications/:id`|`DELETE`|patient_id. medication_id|registrant_id, token
|Create Observer|`v1/patients/:patient>id/observations`|`POST`|patient_id|registrant_id, token
|List Observed Patients|`v1/users/:user_id/observed_patients`|`GET`|user_id|token
|Delete Observation|`v1/users/:user_id/observed_patients/:id`|`DELETE`|user_id, observation_id|token
|Delete Observer|`v1/patients/:patient_id/observations/:id`|patient_id, observation_id|registrant_id, token

## Sample call

### Using HTTPIE client

#### User creation

```bash
$ http POST :3000/v1/users user:='{"email":"john@gmail.com", "given_name":"John", "last_name":"Doe", "password":"123456", "password_confirmation":"123456"}'
```

Sample response:

```bash
{
    "user": {
        "id": "5bba60fb-f617-4b02-b02b-c5890fdc8c24",
        "email": "john@gmail.com",
        "encrypted_password": "$2a$11$pkquZ8GVTb0DrX4fdk27eOkTKkwz0j6gicnF/2BwAQwTkuhLcIJpy",
        "reset_password_token": null,
        "reset_password_sent_at": null,
        "remember_created_at": null,
        "given_name": "john",
        "last_name": "doe",
        "created_at": "2019-12-11T23:52:13.800Z",
        "updated_at": "2019-12-11T23:52:13.800Z",
        "profile_pic": null
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6IjViYmE2MGZiLWY2MTctNGIwMi1iMDJiLWM1ODkwZmRjOGMyNCIsImV4cCI6MTU3NjE5NDczM30.2C9XG28zRp-orJ_ua5R2WUGFnQmwXkmj9sCpemRFrr0"
}
```

## Tests

There are no tests at the moment but it is something that'll eventually be added.

## Authors

### Adriaan Beiertz

- GitHub: [@adriaanbd](https://github.com/adriaanbd)
- Twitter: [@abeiertz](https://twitter.com/abeiertz)
- LinkedIn: [adriaanbd](https://www.linkedin.com/in/adriaanbd/)

### Ryan Vergara

- GitHub: [@rvvergara](https://github.com/rvvergara)
- Twitter: [@CoachRyanV](https://twitter.com/CoachRyanV)
- LinkedIn: [rvvergara](https://www.linkedin.com/in/rvvergara/)

## Contributing

Contributions, issues and feature requests are welcome.

Feel free to check the issues page [here](https://github.com/yelpi-api/readme-template/blob/master/issues)

## License

This project is MIT licensed.
