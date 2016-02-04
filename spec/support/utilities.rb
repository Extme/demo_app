 def full_title(page_title)
   base_title = "SocialNet.Demo"
   if page_title.empty?
     base_title
   else
     "#{base_title} | #{page_title}"
   end
 end

