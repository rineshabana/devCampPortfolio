module ApplicationHelper
	def sample_helper
		content_tag(:div, "My content", class: 'my-class')	
	end

	def login_helper style=''
		if current_user.is_a? GuestUser 
			
			(link_to "Register",new_user_registration_path,class:style).html_safe +
			(link_to "Login",new_user_session_path, class: style ).html_safe
		else
			(link_to "Log out",destroy_user_session_path,method: :delete, class:style).html_safe
		end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]} you're on #{layout_name} layout"
			content_tag(:p,greeting,class: 'session-class')
			
	    end
	end

	def set_copyright
	  ShabanaViewTool::Renderer.copyright 'Shabana Noor', 'All rights reserved'
	end
end
