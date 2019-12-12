Help

Endpoints (using HTTPIE client)

1. User creation

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
