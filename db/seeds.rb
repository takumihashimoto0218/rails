User.create!(
  [
    { name: "test1", email: "test1@gmail.com", password: "testtest"},
    { name: "test2", email: "test2@gmail.com", password: "testtest"},
    { name: "test3", email: "test3@gmail.com", password: "testtest"},
    { name: "test4", email: "test4@gamil.com", password: "testtest"}
  ]
)

Profile.create(
  [
    { name: "test1", user_id: 1, self_introduction: "私はテストユーザーです。よろしくお願いします。"},
    { name: "test1", user_id: 2, self_introduction: "私はテストユーザーです。よろしくお願いします。"},
    { name: "test1", user_id: 3, self_introduction: "私はテストユーザーです。よろしくお願いします。"},
    { name: "test1", user_id: 4, self_introduction: "私はテストユーザーです。よろしくお願いします。"}
  ]
)

Admin.create!(
  email: 'admin@gmail.com',
  password: 'testtest'
)