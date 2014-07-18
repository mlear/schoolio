# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
num = 0

50.times {
	num += 1
	Grade.create(user_id: num, course_id: num, gpa: 3.5)
}

50.times {
	num = rand(1..10)
	Course.create(name: "test #{num}" , subject: "math")
}

BehaviorTrait.create(name: "Energy Level")
BehaviorTrait.create(name: "Assertiveness")
BehaviorTrait.create(name: "Sociability")
BehaviorTrait.create(name: "Manageability")
BehaviorTrait.create(name: "Attitude")
BehaviorTrait.create(name: "Decisiveness")
BehaviorTrait.create(name: "Accommodating")
BehaviorTrait.create(name: "Independence")
BehaviorTrait.create(name: "Objective Judgment")

LearningStyle.create(name: "Visual", description: "This preference includes the depiction of information in maps, spider diagrams, charts, graphs, flow charts, labelled diagrams, and all the symbolic arrows, circles, hierarchies and other devices, that people use to represent what could have been presented in words. This mode could have been called Graphic (G) as that better explains what it covers. It does NOT include still pictures or photographs of reality, movies, videos or PowerPoint. It does include designs, whitespace, patterns, shapes and the different formats that are used to highlight and convey information. When a whiteboard is used to draw a diagram with meaningful symbols for the relationship between different things that will be helpful for those with a Visual preference. It must be more than mere words in boxes that would be helpful to those who have a Read/write preference." )
LearningStyle.create(name: "Aural / Auditory", description: "This perceptual mode describes a preference for information that is 'heard or spoken.' Learners who have this as their main preference report that they learn best from lectures, group discussion, radio, email, using mobile phones, speaking, web-chat and talking things through. Email is included here because; although it is text and could be included in the Read/write category (below), it is often written in chat-style with abbreviations, colloquial terms, slang and non-formal language. The Aural preference includes talking out loud as well as talking to oneself. Often people with this preference want to sort things out by speaking first, rather than sorting out their ideas and then speaking. They may say again what has already been said, or ask an obvious and previously answered question. They have need to say it themselves and they learn through saying it - their way.")
LearningStyle.create(name: "Read / Write", description: "This preference is for information displayed as words. Not surprisingly, many teachers and students have a strong preference for this mode. Being able to write well and read widely are attributes sought by employers of graduates. This preference emphasizes text-based input and output - reading and writing in all its forms but especially manuals, reports, essays and assignments. People who prefer this modality are often addicted to PowerPoint, the Internet, lists, diaries, dictionaries, thesauri, quotations and words, words, words... Note that most PowerPoint presentations and the Internet, GOOGLE and Wikipedia are essentially suited to those with this preference as there is seldom an auditory channel or a presentation that uses Visual symbols.")
LearningStyle.create(name: "Kinesthetic", description: "By definition, this modality refers to the 'perceptual preference related to the use of experience and practice (simulated or real).' Although such an experience may invoke other modalities, the key is that people who prefer this mode are connected to reality, 'either through concrete personal experiences, examples, practice or simulation' [See Fleming & Mills, 1992, pp. 140-141]. It includes demonstrations, simulations, videos and movies of 'real' things, as well as case studies, practice and applications. The key is the reality or concrete nature of the example. If it can be grasped, held, tasted, or felt it will probably be included. People with this as a strong preference learn from the experience of doing something and they value their own background of experiences and less so, the experiences of others. It is possible to write or speak Kinesthetically if the topic is strongly based in reality. An assignment that requires the details of who will do what and when, is suited to those with this preference, as is a case study or a working example of what is intended or proposed.")
LearningStyle.create(name: "Multimodal", description: "Life is multimodal. There are seldom instances where one mode is used, or is sufficient, so that is why there is a four-part VARK profile. That is why the VARK questionnaire provides four scores and also why there are mixtures of those four modes. Those who do not have a standout mode with one preference score well above other scores, are defined as multimodal. They are of two types. There are those who are flexible in their communication preferences and who switch from mode to mode depending on what they are working with. They are context specific. They choose a single mode to suit the occasion or situation. If they have to deal with legalities they will apply their Read/write preference. If they are to watch the demonstration of a technique they will be expressing their Kinesthetic preference. They are described as VARK Type One? in our database and they may have two, three or four almost-equal preferences in their VARK scores. There are others who are not satisfied until they have had input (or output) in all of their preferred modes. They take longer to gather information from each mode and, as a result, they often have a deeper and broader understanding. They may be seen as procrastinators or slow-deliverers but some may be merely gathering all the information before acting - and their decision making and learning may be better because of that breadth of understanding. They are described as VARK Type Two in our database.")