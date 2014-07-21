  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p 'creating interests...'

['sports', 'music', 'drama', 'animals', 'reading', 'tech', 'movies', 'the ladies', 'tv', 'skateboarding', 'wine'].each do |interest|
  Interest.create(name: interest)
end

p 'creating students and instructors...'

Instructor.create(first_name: "Matt", last_name: "Jones", email: "matt@jones.com", password: "p")
Instructor.create(first_name: "Jonathon", last_name: "Eyler-Werve", email: "jonathon@dbc.com", password: "bootstrap")
Instructor.create(first_name: "Mike", last_name: "Likes-Bikes", email: "mike@likes.bikes", password: "p")
Student.create(first_name: "Marty", last_name: "Lear", email: "m.lear@gmail.com", password: "yolo")
Student.create(first_name: "Isaac", last_name: "Molotovski", email: "i_am@hacking.com", password: "hacker")

48.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Student.create({
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@email.com",
    password: "foobar"
    })
end

p 'creating behavior_traits...'

["Energy Level",
"Assertiveness",
"Sociability",
"Manageability",
"Attitude",
"Decisiveness",
"Accommodating",
"Independence",
"Objective Judgment"].each do |trait|
  BehaviorTrait.create(name: trait)
end

p 'creating learning_styles...'

learning_styles = [{ name: "Visual", description: "This preference includes the depiction of information in maps, spider diagrams, charts, graphs, flow charts, labelled diagrams, and all the symbolic arrows, circles, hierarchies and other devices, that people use to represent what could have been presented in words. This mode could have been called Graphic (G) as that better explains what it covers. It does NOT include still pictures or photographs of reality, movies, videos or PowerPoint. It does include designs, whitespace, patterns, shapes and the different formats that are used to highlight and convey information. When a whiteboard is used to draw a diagram with meaningful symbols for the relationship between different things that will be helpful for those with a Visual preference. It must be more than mere words in boxes that would be helpful to those who have a Read/write preference."  },
{ name: "Aural / Auditory", description: "This perceptual mode describes a preference for information that is 'heard or spoken.' Learners who have this as their main preference report that they learn best from lectures, group discussion, radio, email, using mobile phones, speaking, web-chat and talking things through. Email is included here because; although it is text and could be included in the Read/write category (below), it is often written in chat-style with abbreviations, colloquial terms, slang and non-formal language. The Aural preference includes talking out loud as well as talking to oneself. Often people with this preference want to sort things out by speaking first, rather than sorting out their ideas and then speaking. They may say again what has already been said, or ask an obvious and previously answered question. They have need to say it themselves and they learn through saying it - their way." },
{ name: "Read / Write", description: "This preference is for information displayed as words. Not surprisingly, many teachers and students have a strong preference for this mode. Being able to write well and read widely are attributes sought by employers of graduates. This preference emphasizes text-based input and output - reading and writing in all its forms but especially manuals, reports, essays and assignments. People who prefer this modality are often addicted to PowerPoint, the Internet, lists, diaries, dictionaries, thesauri, quotations and words, words, words... Note that most PowerPoint presentations and the Internet, GOOGLE and Wikipedia are essentially suited to those with this preference as there is seldom an auditory channel or a presentation that uses Visual symbols." },
{ name: "Kinesthetic", description: "By definition, this modality refers to the 'perceptual preference related to the use of experience and practice (simulated or real).' Although such an experience may invoke other modalities, the key is that people who prefer this mode are connected to reality, 'either through concrete personal experiences, examples, practice or simulation' [See Fleming & Mills, 1992, pp. 140-141]. It includes demonstrations, simulations, videos and movies of 'real' things, as well as case studies, practice and applications. The key is the reality or concrete nature of the example. If it can be grasped, held, tasted, or felt it will probably be included. People with this as a strong preference learn from the experience of doing something and they value their own background of experiences and less so, the experiences of others. It is possible to write or speak Kinesthetically if the topic is strongly based in reality. An assignment that requires the details of who will do what and when, is suited to those with this preference, as is a case study or a working example of what is intended or proposed." },
{ name: "Multimodal", description: "Life is multimodal. There are seldom instances where one mode is used, or is sufficient, so that is why there is a four-part VARK profile. That is why the VARK questionnaire provides four scores and also why there are mixtures of those four modes. Those who do not have a standout mode with one preference score well above other scores, are defined as multimodal. They are of two types. There are those who are flexible in their communication preferences and who switch from mode to mode depending on what they are working with. They are context specific. They choose a single mode to suit the occasion or situation. If they have to deal with legalities they will apply their Read/write preference. If they are to watch the demonstration of a technique they will be expressing their Kinesthetic preference. They are described as VARK Type One? in our database and they may have two, three or four almost-equal preferences in their VARK scores. There are others who are not satisfied until they have had input (or output) in all of their preferred modes. They take longer to gather information from each mode and, as a result, they often have a deeper and broader understanding. They may be seen as procrastinators or slow-deliverers but some may be merely gathering all the information before acting - and their decision making and learning may be better because of that breadth of understanding. They are described as VARK Type Two in our database." }]

learning_styles.each { |ls| LearningStyle.create(ls) }

[ {name: "While Loops 200", subject: "Computer Science", instructor_id: rand(1..2)},
  {name: "CSS 404", subject: "Computer Science", instructor_id: 2},
  {name: "Recursion 101", subject: "Recursion", instructor_id: rand(1..2)},
  {name: "Ukuleles, and How to Play Them", subject: "Computer Science", instructor_id: rand(1..2)},
  {name: "Coding", subject: "(The New) Literacy", instructor_id: rand(1..2)},
  {name: "Literacy (is still)", subject: "(The New) Literacy", instructor_id: rand(1..2)},
  {name: "The Difference Between What Snakes and Salamanders Sound Like", subject: "Animal Studies", instructor_id: rand(1..2)},
  {name: "Puns", subject: "Computer Science", instructor_id: 1},
  {name: "Nice", subject: "Literacy", instructor_id: 3},
  {name: "Poopsmithery", subject: "Animal Studies", instructor_id: rand(1..2)},
  {name: "Who Cares About Errors?", subject: "Computer Science", instructor_id: 1},
  {name: "How to AJAX Everything", subject: "Computer Science", instructor_id: rand(1..2)} ].each do |a_class|
  Course.create(a_class)
end

p 'seeding students with stuff'

Student.all.each do |student|
  Course.all.each do |course|
    4.times do
      student.grades << Grade.create({
        student_id: student.id,
        course_id: course.id,
        gpa: rand(20..40).to_f / 10
      })
    end
  end
  student.learning_style_id = rand(1..5)
  student.behavior_traits << BehaviorTrait.all.sample(3)
  student.interests << Interest.all.sample(3)
  student.save
end

puts 'done seeding'
