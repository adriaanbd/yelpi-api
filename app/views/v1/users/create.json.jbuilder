json.user do
  json.partial! 'v1/shared/user', user: user
end
json.token token