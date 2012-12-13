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
    
    def search_users(query_string)
      return nil if query_string.blank?
      users = perform_authorized_request!(GET, "#{USERS_SEARCH_URL}?q=#{CGI::escape(query_string)}")
      users.map! { |u| u[:id] }.map { |user_id| user(user_id) }
    end # def search_users

    def users
      users = perform_authorized_request!(GET, "#{USERS_URL}")
      users.map! { |u| u[:id] }.map { |user_id| user(user_id) }
    end # def users
    
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
    
    def search_notes(query_string)
      return nil if query_string.blank?
      notes = perform_authorized_request!(GET, "#{NOTES_SEARCH_URL}?q=#{query_string}")
      notes.map! { |n| n[:id] }.map { |note_id| note(note_id) }
    end # def search_users
    
    def note(note_id)
      return nil if note_id.blank?
      note = perform_authorized_request!(GET, "#{NOTES_URL}/#{note_id}")
      Note.new(note)
    end # def topic
    
    def post_note(note_data)
      raise MalformedResourceError, "Malformed note data: #{note_data}" unless note_data.kind_of? Hash
      raise MalformedResourceError, "Missing title" unless note_data[:title]
      
      note_data[:type] = NOTE
      response = perform_authorized_request!(POST, NOTES_URL, :data => note_data)
      note(response[:id])
    end # def post_note
    
    def links
      links = perform_authorized_request!(GET, LINKS_URL)
      links.map { |link| Link.new(link) }
    end # def links
    
    def featured_links
      featured_links = perform_authorized_request!(GET, FEATURED_LINKS_URL)
      featured_links.map { |link| Linw.new(link) }
    end # def featured_links
    
    def search_links(query_string)
      return nil if query_string.blank?
      links = perform_authorized_request!(GET, "#{LINKS_SEARCH_URL}?q=#{query_string}")
      links.map! { |l| l[:id] }.map { |link_id| link(link_id) }
    end # def search_users
    
    def link(link_id)
      return nil if link_id.blank?
      link = perform_authorized_request!(GET, "#{LINKS_URL}/#{link_id}")
      Link.new(link)
    end # def topic

    def post_link(link_data)
      raise MalformedResourceError, "Malformed note data: #{link_data}" unless link_data.kind_of? Hash
      raise MalformedResourceError, "Missing URL" unless link_data[:url]

      link_data[:type] = LINK
      response = perform_authorized_request!(POST, LINKS_URL, :data => link_data)
      link(response[:id])
    end # def post_link
    
    def questions
      questions = perform_authorized_request!(GET, QUESTIONS_URL)
      questions.map { |question| Question.new(question) }
    end # def questions
    
    def featured_questions
      featured_questions = perform_authorized_request!(GET, FEATURED_QUESTIONS_URL)
      featured_questions.map { |question| Question.new(question) }
    end # def featured_questions
    
    def search_questions(query_string)
      return nil if query_string.blank?
      questions = perform_authorized_request!(GET, "#{QUESTIONS_SEARCH_URL}?q=#{query_string}")
      questions.map! { |q| q[:id] }.map { |q_id| question(q_id) }
    end # def search_users
    
    def question(question_id)
      return nil if question_id.blank?
      question = perform_authorized_request!(GET, "#{QUESTIONS_URL}/#{question_id}")
      Question.new(question)
    end # def topic

    def post_question(question_data)
      raise MalformedResourceError, "Malformed question data: #{question_data}" unless question_data.kind_of? Hash
      raise MalformedResourceError, "Missing title" unless question_data[:title]

      question_data[:type] = QUESTION
      response = perform_authorized_request!(POST, QUESTIONS_URL, :data => question_data)
      question(response[:id])
    end # def question_note
    
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