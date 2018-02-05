module CommentsHelper
	def nested_comments(comments)
		comments.map do |comment, sub_comments|
			content_tag(:div, render(comment))
		end
	end
end
