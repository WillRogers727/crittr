module CommentsHelper
	def nested_comments(comments)
		comments.map do |comment, sub_comments|
			content_tag(:div, render(comment), class: 'commentContainer')
		end.join.html_safe
	end
end
