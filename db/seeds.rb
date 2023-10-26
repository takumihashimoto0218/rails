case Rails.env
when "development"
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

  # Admin.create!(
  #   email: 'admin@gmail.com',
  #   password: 'testtest'
  # )

  20.times do |n|
    board = Board.create!(
      title: "Board Title #{n}",
      user_id: rand(1..4)
    )

    2.times do |m|
      list = board.lists.create!(
        title: "List Title #{n}-#{m}"
      )

      3.times do |k|
        list.tasks.create!(
          title: "Task Title #{n}-#{m}-#{k}",
          body: "Task Body #{n}-#{m}-#{k}"
        )
      end
    end
  end

  20.times do |n|
    pack = Pack.create!(
      title: "PackTitle#{n+1}"
    )
    3.times do |m|
      topic_id_from_url = 20 + (n * 3 + m)
      Packdetail.create!(
        topic_id: topic_id_from_url,
        pack_id: pack.id
      )
    end
  end

when "production"
  Admin.create!(
    email: 'admin@gmail.com',
    password: 'testtest'
  )
end

