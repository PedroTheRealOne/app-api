# USER seeds
pedro = User.create(email: "pedrotherealone1@gmail.com", password: "123asd", password_confirmation: "123asd")
marco = User.create(email: "marco@gmail.com", password: "123asd", password_confirmation: "123asd")
jow = User.create(email: "jow@gmail.com", password: "123asd", password_confirmation: "123asd")

# POST seeds
post1 = Post.create(content: "FATE GO é muito slk", user: pedro)
post2 = Post.create(content: "FATE GO é ruim dropa essa merda", user: jow)
post3 = Post.create(content: "Rerun da hutao quando?", user: marco)
