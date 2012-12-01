module Crowdbase
  module Methods
    
    def me
      User.new(perform_authorized_request!(GET, ME_URL))
    end # def me
    
    def posts
      result = []
      posts = perform_authorized_request!(GET, POSTS_URL)
      
      posts.each do |post|
        post_klass = eval(post[:type].try(:capitalize))
        result << post_klass.new(post)
      end # for each post
      result
    end # def posts
    
    def user(user_id)
      return nil if user_id.blank?
      user = perform_authorized_request!(GET, "#{USERS_URL}/#{user_id}")
      User.new(user)
    end # def user
    
    def following
      followings = perform_authorized_request!(GET, FOLLOWING_URL)
      followings.map { |following| User.new(following) }
    end # def following
    
    def followers
      followers = perform_authorized_request!(GET, FOLLOWERS_URL)
      followers.map { |followers| User.new(followers) }
    end # def followers
    
    def notes
      notes = perform_authorized_request!(GET, NOTES_URL)
      notes.map { |note| Note.new(note) }
    end # def notes
    
    def featured_notes
      featured_notes = perform_authorized_request!(GET, NOTES_URL)
      featured_notes.map { |note| Note.new(note) }
    end # def featured_notes
    
    def note(note_id)
      return nil if note_id.blank?
      note = perform_authorized_request!(GET, "#{NOTES_URL}/#{note_id}")
      Note.new(note)
    end # def topic
    
    def links
      links = perform_authorized_request!(GET, LINKS_URL)
      links.map { |link| Link.new(link) }
    end # def links
    
    def featured_links
      featured_links = perform_authorized_request!(GET, FEATURED_LINKS_URL)
      featured_links.map { |link| Linw.new(link) }
    end # def featured_links
    
    def link(link_id)
      return nil if link_id.blank?
      link = perform_authorized_request!(GET, "#{LINKS_URL}/#{link_id}")
      Link.new(link)
    end # def topic
    
    def questions
      questions = perform_authorized_request!(GET, QUESTIONS_URL)
      questions.map { |question| Question.new(question) }
    end # def questions
    
    def featured_questions
      featured_questions = perform_authorized_request!(GET, FEATURED_QUESTIONS_URL)
      featured_questions.map { |question| Question.new(question) }
    end # def featured_questions
    
    def question(question_id)
      return nil if question_id.blank?
      link = perform_authorized_request!(GET, "#{QUESTIONS_URL}/#{question_id}")
      Question.new(question)
    end # def topic
    
    def topics
      topics = perform_authorized_request!(GET, TOPICS_URL)
      topics.map { |topic| Topic.new(topic) }
    end # def topics
    
    def topic(topic_id)
      return nil if topic_id.blank?
      topic = perform_authorized_request!(GET, "#{TOPICS_URL}/#{topic_id}")
      Topic.new(topic)
    end # def topic
    
  end # module Methods
end # module Crowdbase