User.create!(
  [
    { name: "test1", email: "test1@gmail.com", password: "testtest"},
    { name: "test2", email: "test2@gmail.com", password: "testtest"},
    { name: "test3", email: "test3@gmail.com", password: "testtest"},
    { name: "test4", email: "test4@gamil.com", password: "testtest"}
  ]
)

Admin.create!(
  email: 'admin@gmail.com',
  password: 'testtest'
)